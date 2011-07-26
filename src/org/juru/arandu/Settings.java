package org.juru.arandu;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.juru.arandu.dao.OauthPermission;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.gdata.client.authn.oauth.GoogleOAuthParameters;
import com.google.gdata.client.authn.oauth.OAuthException;
import com.google.gdata.client.authn.oauth.OAuthHmacSha1Signer;
import com.google.gdata.client.contacts.ContactsService;
import com.google.gdata.data.Link;
import com.google.gdata.data.contacts.ContactEntry;
import com.google.gdata.data.contacts.ContactFeed;
import com.google.gdata.data.contacts.GroupMembershipInfo;
import com.google.gdata.data.extensions.Email;
import com.google.gdata.data.extensions.Name;
import com.google.gdata.util.ServiceException;

@SuppressWarnings("serial")
public class Settings extends HttpServlet {
	  private static final Logger log =
	            Logger.getLogger(Settings.class.getName());
	static String CONSUMER_KEY = "arandujejogua.appspot.com";
	static String CONSUMER_SECRET = "a9CGl8v8teVPFsgs4d6xjz4f";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		log.info("Empieza settings");
		
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Key userKey = KeyFactory.createKey("Users", user.getUserId());
		Query query = new Query("OauthPermission", userKey);
		try {

			List<Entity> lista = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
			
			if(lista!=null){
				for(Entity permiso : lista){
				if (((String)permiso.getProperty("servicio")).equalsIgnoreCase("contact")) {
						GoogleOAuthParameters oauthParameters = new GoogleOAuthParameters();
						oauthParameters.setOAuthConsumerKey(CONSUMER_KEY);
						oauthParameters.setOAuthConsumerSecret(CONSUMER_SECRET);

						// This is interesting: we set the OAuth token and the token secret
						// to the values extracted by oauthHelper earlier. These values are
						// already in scope in this example code, but they can be populated
						// from reading from the datastore or some other persistence
						// mechanism.
						oauthParameters.setOAuthToken((String)permiso.getProperty("accessToken"));
						oauthParameters.setOAuthTokenSecret((String)permiso.getProperty("accessTokenSecret"));
						try{
						ContactsService client = new ContactsService("arandujejogua-v1");

						// Use our newly built oauthParameters
						client.setOAuthCredentials(oauthParameters,
								new OAuthHmacSha1Signer());

						URL feedUrl = new URL(
								"https://www.google.com/m8/feeds/contacts/default/full");
						ContactFeed resultFeed = client.getFeed(feedUrl, ContactFeed.class);
						// Print the results
						out.println(resultFeed.getTitle().getPlainText());
						for (int i = 0; i < resultFeed.getEntries().size(); i++) {
							ContactEntry entry = resultFeed.getEntries().get(i);
							if (entry.hasName()) {
								Name name = entry.getName();
								out.println("Nombre: " + name + "\n");
							} else {
								out.println("\t (no name found) \n");
							}

							out.println("Email addresses:");
							for (Email email : entry.getEmailAddresses()) {
								out.print(" " + email.getAddress());
								if (email.getRel() != null) {
									out.print(" rel:" + email.getRel());
								}
								if (email.getLabel() != null) {
									out.print(" label:" + email.getLabel());
								}
								if (email.getPrimary()) {
									out.print(" (primary) ");
								}
								out.print("\n");
							}

							out.println("Groups:");
							for (GroupMembershipInfo group : entry
									.getGroupMembershipInfos()) {
								String groupHref = group.getHref();
								out.println("  Id: " + groupHref);
							}

							Link photoLink = entry.getContactPhotoLink();
							String photoLinkHref = photoLink.getHref();
							out.println("<img src='" + photoLinkHref + "'/>");

							if (photoLink.getEtag() != null) {
								out.println("Contact Photo's ETag: " + photoLink.getEtag());
							}
						}

					} catch (OAuthException e) {
						// Something went wrong. Usually, you'll end up here if we have
						// invalid
						// oauth tokens
					} catch (ServiceException e) {
						// Handle this exception

				}
			} else {
				out.println("No tiene permisos");
				
			}
				}
			}
		} finally {
			out.println("termina settings");
		}
		

	}

	
}
