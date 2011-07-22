package org.juru.arandu;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.google.gdata.data.extensions.ExtendedProperty;
import com.google.gdata.data.extensions.Im;
import com.google.gdata.data.extensions.Name;
import com.google.gdata.util.ServiceException;

@SuppressWarnings("serial")
public class RequestTokenCallbackServlet extends HttpServlet{
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
            // servlet that makes API calls. For the safe of clarity and simplicity,
            // we'll just reuse this servlet for making API calls.
            oauthParameters = new GoogleOAuthParameters();
            oauthParameters.setOAuthConsumerKey(CONSUMER_KEY);
            oauthParameters.setOAuthConsumerSecret(CONSUMER_SECRET);

            // This is interesting: we set the OAuth token and the token secret
            // to the values extracted by oauthHelper earlier. These values are
            // already in scope in this example code, but they can be populated
            // from reading from the datastore or some other persistence mechanism.
            oauthParameters.setOAuthToken(accessToken);
            oauthParameters.setOAuthTokenSecret(accessTokenSecret);

            // Create an instance of the DocsService to make API calls
            ContactsService client = new ContactsService("arandujejogua-v1");

            // Use our newly built oauthParameters
            client.setOAuthCredentials(oauthParameters, new OAuthHmacSha1Signer());

            URL feedUrl = new URL("https://www.google.com/m8/feeds/contacts/default/full");
            ContactFeed resultFeed = client.getFeed(feedUrl, ContactFeed.class);
            // Print the results
            out.println(resultFeed.getTitle().getPlainText());
            for (int i = 0; i < resultFeed.getEntries().size(); i++) {
              ContactEntry entry = resultFeed.getEntries().get(i);
              if (entry.hasName()) {
                Name name = entry.getName();
                if (name.hasFullName()) {
                  String fullNameToDisplay = name.getFullName().getValue();
                  if (name.getFullName().hasYomi()) {
                    fullNameToDisplay += " (" + name.getFullName().getYomi() + ")";
                  }
                  out.println("\t\t" + fullNameToDisplay);
                } else {
                  out.println("\t\t (no full name found)");
                }
                if (name.hasNamePrefix()) {
                  out.println("\t\t" + name.getNamePrefix().getValue());
                } else {
                  out.println("\t\t (no name prefix found)");
                }
                if (name.hasGivenName()) {
                  String givenNameToDisplay = name.getGivenName().getValue();
                  if (name.getGivenName().hasYomi()) {
                    givenNameToDisplay += " (" + name.getGivenName().getYomi() + ")";
                  }
                  out.println("\t\t" + givenNameToDisplay);
                } else {
                  out.println("\t\t (no given name found)");
                }
                if (name.hasAdditionalName()) {
                  String additionalNameToDisplay = name.getAdditionalName().getValue();
                  if (name.getAdditionalName().hasYomi()) {
                    additionalNameToDisplay += " (" + name.getAdditionalName().getYomi() + ")";
                  }
                  out.println("\t\t" + additionalNameToDisplay);
                } else {
                  out.println("\t\t (no additional name found)");
                }
                if (name.hasFamilyName()) {
                  String familyNameToDisplay = name.getFamilyName().getValue();
                  if (name.getFamilyName().hasYomi()) {
                    familyNameToDisplay += " (" + name.getFamilyName().getYomi() + ")";
                  }
                  out.println("\t\t" + familyNameToDisplay);
                } else {
                  out.println("\t\t (no family name found)");
                }
                if (name.hasNameSuffix()) {
                  out.println("\t\t" + name.getNameSuffix().getValue());
                } else {
                  out.println("\t\t (no name suffix found)");
                }
              } else {
                out.println("\t (no name found)");
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

              out.println("IM addresses:");
              for (Im im : entry.getImAddresses()) {
                out.print(" " + im.getAddress());
                if (im.getLabel() != null) {
                  out.print(" label:" + im.getLabel());
                }
                if (im.getRel() != null) {
                  out.print(" rel:" + im.getRel());
                }
                if (im.getProtocol() != null) {
                  out.print(" protocol:" + im.getProtocol());
                }
                if (im.getPrimary()) {
                  out.print(" (primary) ");
                }
                out.print("\n");
              }

              out.println("Groups:");
              for (GroupMembershipInfo group : entry.getGroupMembershipInfos()) {
                String groupHref = group.getHref();
                out.println("  Id: " + groupHref);
              }

              out.println("Extended Properties:");
              for (ExtendedProperty property : entry.getExtendedProperties()) {
                if (property.getValue() != null) {
                  out.println("  " + property.getName() + "(value) = " +
                      property.getValue());
                } else if (property.getXmlBlob() != null) {
                  out.println("  " + property.getName() + "(xmlBlob)= " +
                      property.getXmlBlob().getBlob());
                }
              }

              Link photoLink = entry.getContactPhotoLink();
              String photoLinkHref = photoLink.getHref();
              out.println("Photo Link: " + photoLinkHref);

              if (photoLink.getEtag() != null) {
                out.println("Contact Photo's ETag: " + photoLink.getEtag());
              }

              out.println("Contact's ETag: " + entry.getEtag());
            }

        } catch (OAuthException e) {
            // Something went wrong. Usually, you'll end up here if we have invalid
            // oauth tokens
        } catch (ServiceException e) {
            // Handle this exception
        }
    }
}
