package villano

import java.util.Set

class Villano {
	@Property String nombre
	@Property String sexo
	@Property Set<String> seniasParticulares
	@Property Set<String> hobbies
	
	new(String nombre, String sexo, Set<String> seniasParticulares,
		Set<String> hobbies) {
		if(nombre.empty || hobbies.size.equals(0) || seniasParticulares.size < 2) {
			throw new RuntimeException("El villano debe tener nombre y, al menos, 2 señas particulares y un hobbie.")
		}
		_nombre = nombre
		_sexo = sexo
		_hobbies = hobbies
		_seniasParticulares = seniasParticulares
	}
	/*
	 * Tengan en cuenta que es obligatorio ingresar el nombre del villano y,
	 * al menos, 2 señas particulares y un hobbie.
	 */
	 
	def agregarSeniaParticular(String senia) {
		this._seniasParticulares.add(senia)
	}
	
	def eliminarSeniaPArticular (String senia) {
		this._seniasParticulares.remove(senia)
	}

	override toString() {
		nombre
	}
	
	def agregarHobbie (String hobbie) {
		this._hobbies.add(hobbie)
	}
	
	def eliminarHobbie (String hobbie) {
		this._hobbies.remove(hobbie)
	}
	
	def setNombre (String nombre) {
		this._nombre = nombre
	}
	
	def syncWith(Villano unVillano) {
		nombre = unVillano.nombre
		sexo = unVillano.sexo
		hobbies = unVillano.hobbies
		seniasParticulares = unVillano.seniasParticulares
	}
	
}