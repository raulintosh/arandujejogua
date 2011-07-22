package org.juru.arandu.dao;

public class OauthPermission {

	String servicio;
	String oauth_verifier;
	String oauth_token;
	
	public OauthPermission(String servicio, String oauth_verifier,
			String oauth_token) {
		super();
		this.servicio = servicio;
		this.oauth_verifier = oauth_verifier;
		this.oauth_token = oauth_token;
	}
	
	public String getServicio() {
		return servicio;
	}
	public void setServicio(String servicio) {
		this.servicio = servicio;
	}
	public String getOauth_verifier() {
		return oauth_verifier;
	}
	public void setOauth_verifier(String oauth_verifier) {
		this.oauth_verifier = oauth_verifier;
	}
	public String getOauth_token() {
		return oauth_token;
	}
	public void setOauth_token(String oauth_token) {
		this.oauth_token = oauth_token;
	}
	
	
	
}
