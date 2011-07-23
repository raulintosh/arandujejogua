package org.juru.arandu.dao;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.google.gdata.data.geo.Point;


@Entity
public class Negocio {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nombre;
	private String direccion;
	private String ruc;
	private String telefono;
	private Rubro rubro;
	private Point latlot;
	private Users creadopor;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public Rubro getRubro() {
		return rubro;
	}
	public void setRubro(Rubro rubro) {
		this.rubro = rubro;
	}
	public Point getLatlot() {
		return latlot;
	}
	public void setLatlot(Point latlot) {
		this.latlot = latlot;
	}
	public Users getCreadopor() {
		return creadopor;
	}
	public void setCreadopor(Users creadopor) {
		this.creadopor = creadopor;
	}
	
	
	
}
