package org.juru.arandu.dao;

public class OauthPermission {

	String servicio;
	String accessToken;
	String accessTokenSecret;
	
	public OauthPermission(String servicio, String oauth_verifier,
			String oauth_token) {
		super();
		this.servicio = servicio;
		this.accessToken = oauth_verifier;
		this.accessTokenSecret = oauth_token;
	}

	public String getServicio() {
		return servicio;
	}

	public void setServicio(String servicio) {
		this.servicio = servicio;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getAccessTokenSecret() {
		return accessTokenSecret;
	}

	public void setAccessTokenSecret(String accessTokenSecret) {
		this.accessTokenSecret = accessTokenSecret;
	}
	
}
