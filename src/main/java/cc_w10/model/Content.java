package cc_w10.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="content_table")
public class Content implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String tittle;	
	private String cont;
	
	public Content(){}
	
	public Content(String tittle, String cont) {
		super();
		this.tittle = tittle;
		this.cont = cont;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	@Override
	public String toString() {
		return "Content [id=" + id + ", tittle=" + tittle + ", cont=" + cont + "]";
	}	
	
	
}
