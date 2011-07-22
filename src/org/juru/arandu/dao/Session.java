package org.juru.arandu.dao;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Session {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private com.google.appengine.api.users.User usuario;
	private Date fecha;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public com.google.appengine.api.users.User getUsuario() {
		return usuario;
	}
	public void setUsuario(com.google.appengine.api.users.User usuario) {
		this.usuario = usuario;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
}
