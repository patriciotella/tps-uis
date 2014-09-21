package villano

import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class Villano {
	@Property String nombre
	@Property String sexo
	@Property List<String> seniasParticulares
	@Property List<String> hobbies
			
	new() {
		seniasParticulares = newArrayList
		hobbies = newArrayList
		nombre = ""
		sexo = ""
	}
	
	/*
	 * Tengan en cuenta que es obligatorio ingresar el nombre del villano y,
	 * al menos, 2 señas particulares y un hobbie.
	 */
	 
	def agregarSeniaParticular(String senia) {
		this._seniasParticulares.add(senia)
		ObservableUtils.firePropertyChanged(this,"seniasParticulares", seniasParticulares)
	}
	
	def eliminarSeniaPArticular (String senia) {
		this._seniasParticulares.remove(senia)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}

	override toString() {
		nombre
	}
	
	def agregarHobbie (String hobbie) {
		this._hobbies.add(hobbie)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def eliminarHobbie (String hobbie) {
		this._hobbies.remove(hobbie)
		ObservableUtils.firePropertyChanged(this,"hobbies",hobbies)
	}
	
	def setNombre (String nombre) {
		this._nombre = nombre
//		ObservableUtils.firePropertyChanged(this, "puedeCrearVillano", puedeCrearVillano)
	}
	
//	def puedeCrearVillano() {
//		!this._nombre.equals("")
//	}

}