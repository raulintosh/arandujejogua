package org.juru.arandu.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.google.appengine.api.datastore.Email;
import com.google.appengine.api.users.User;

@Entity(name="Users")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Email email;
	private User user;
	private List<OauthPermission> permisos_api;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Email getEmail() {
		return email;
	}
	public void setEmail(Email email) {
		this.email = email;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OauthPermission> getPermisos_api() {
		return permisos_api;
	}
	public void setPermisos_api(List<OauthPermission> permisos_api) {
		this.permisos_api = permisos_api;
	}

}
