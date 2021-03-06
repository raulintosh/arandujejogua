package org.juru.arandu;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.juru.arandu.dao.OauthPermission;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.gdata.client.authn.oauth.GoogleOAuthHelper;
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
public class RequestTokenCallbackServlet extends HttpServlet {
	static String CONSUMER_KEY = "arandujejogua.appspot.com";
	static String CONSUMER_SECRET = "a9CGl8v8teVPFsgs4d6xjz4f";

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		// Create an instance of GoogleOAuthParameters
		GoogleOAuthParameters oauthParameters = new GoogleOAuthParameters();
		oauthParameters.setOAuthConsumerKey(CONSUMER_KEY);
		oauthParameters.setOAuthConsumerSecret(CONSUMER_SECRET);

		GoogleOAuthHelper oauthHelper = new GoogleOAuthHelper(
				new OAuthHmacSha1Signer());

		// Remember the token secret that we stashed? Let's get it back
		// now. We need to add it to oauthParameters
		String oauthTokenSecret = (String) req.getSession().getAttribute(
				"oauthTokenSecret");
		oauthParameters.setOAuthTokenSecret(oauthTokenSecret);

		// The query string should contain the oauth token, so we can just
		// pass the query string to our helper object to correctly
		// parse and add the parameters to our instance of oauthParameters
		oauthHelper.getOAuthParametersFromCallback(req.getQueryString(),
				oauthParameters);

		try {

			// Now that we have all the OAuth parameters we need, we can
			// generate an access token and access token secret. These
			// are the values we want to keep around, as they are
			// valid for all API calls in the future until a user revokes
			// our access.
			String accessToken = oauthHelper.getAccessToken(oauthParameters);
			String accessTokenSecret = oauthParameters.getOAuthTokenSecret();

			// In a real application, we want to redirect the user to a new
			// servlet that makes API calls. For the safe of clarity and
			// simplicity,
			// we'll just reuse this servlet for making API calls.
			oauthParameters = new GoogleOAuthParameters();
			oauthParameters.setOAuthConsumerKey(CONSUMER_KEY);
			oauthParameters.setOAuthConsumerSecret(CONSUMER_SECRET);

			// This is interesting: we set the OAuth token and the token secret
			// to the values extracted by oauthHelper earlier. These values are
			// already in scope in this example code, but they can be populated
			// from reading from the datastore or some other persistence
			// mechanism.
			oauthParameters.setOAuthToken(accessToken);
			oauthParameters.setOAuthTokenSecret(accessTokenSecret);

			UserService userService = UserServiceFactory.getUserService();
			User user = userService.getCurrentUser();
			DatastoreService datastore = DatastoreServiceFactory
					.getDatastoreService();
			
			Key userKey = KeyFactory.createKey("Users", user.getUserId());
			try {

				Entity u = new Entity("OauthPermission", userKey);
				u.setProperty("servicio", "contact");
				u.setProperty("accessToken", accessToken);
				u.setProperty("accessTokenSecret", accessTokenSecret);
				u.setProperty("user", user);
				datastore.put(u);
			} finally {

			}

			// Create an instance of the DocsService to make API calls
			ContactsService client = new ContactsService("arandujejogua-v1");

			// Use our newly built oauthParameters
			client.setOAuthCredentials(oauthParameters,
					new OAuthHmacSha1Signer());

			URL feedUrl = new URL(
					"https://www.google.com/m8/feeds/contacts/default/full");
			ContactFeed resultFeed = client.getFeed(feedUrl, ContactFeed.class);
			// Print the results
			
			req.getSession().setAttribute("resultFeed", resultFeed);
			resp.sendRedirect("index.jsp");

		} catch (OAuthException e) {
			// Something went wrong. Usually, you'll end up here if we have
			// invalid
			// oauth tokens
		} catch (ServiceException e) {
			// Handle this exception
		}
	}
}
