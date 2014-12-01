package domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable

@Accessors
class Villano implements Serializable {
	String nombre
	String sexo
	Set<String> seniasParticulares
	Set<String> hobbies
	
	new(String nombre, String sexo, Set<String> seniasParticulares,
		Set<String> hobbies) {
		if(nombre.empty || hobbies.size.equals(0) || seniasParticulares.size < 2) {
			throw new RuntimeException("El villano debe tener nombre y, al menos, 2 señas particulares y un hobbie.")
		}
		this.nombre = nombre
		this.sexo = sexo
		this.hobbies = hobbies
		this.seniasParticulares = seniasParticulares
	}
	/*
	 * Tengan en cuenta que es obligatorio ingresar el nombre del villano y,
	 * al menos, 2 señas particulares y un hobbie.
	 */
	 
	def agregarSeniaParticular(String senia) {
		this.seniasParticulares.add(senia)
	}
	
	def eliminarSeniaPArticular (String senia) {
		this.seniasParticulares.remove(senia)
	}

	override toString() {
		nombre
	}
	
	def agregarHobbie (String hobbie) {
		this.hobbies.add(hobbie)
	}
	
	def eliminarHobbie (String hobbie) {
		this.hobbies.remove(hobbie)
	}
	
	def setNombre (String nombre) {
		this.nombre = nombre
	}
	
	def syncWith(Villano unVillano) {
		nombre = unVillano.nombre
		sexo = unVillano.sexo
		hobbies = unVillano.hobbies
		seniasParticulares = unVillano.seniasParticulares
	}
	
}