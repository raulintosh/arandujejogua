package org.juru.arandu.dao;

import com.google.appengine.api.users.User;

public class OauthPermission {

	String servicio;
	String accessToken;
	String accessTokenSecret;
	User user;
	public OauthPermission(String servicio, String accessToken,
			String accessTokenSecret, User user) {
		super();
		this.servicio = servicio;
		this.accessToken = accessToken;
		this.accessTokenSecret = accessTokenSecret;
		this.user = user;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
