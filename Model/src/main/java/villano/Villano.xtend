package villano

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import java.util.Set
import org.uqbar.commons.model.UserException

@Observable
class Villano {
	@Property String nombre
	@Property String sexo
	@Property Set<String> seniasParticulares
	@Property Set<String> hobbies
	
	new(String nombre, String sexo, Set<String> seniasParticulares,
		Set<String> hobbies) {
		if(nombre == "" || hobbies.size.equals(0) || seniasParticulares.size < 2) {
			throw new UserException("El villano debe tener nombre y, al menos, 2 señas particulares y un hobbie.")
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
	}
	
	def syncWith(Villano unVillano) {
		nombre = unVillano.nombre
		sexo = unVillano.sexo
		hobbies = unVillano.hobbies
		seniasParticulares = unVillano.seniasParticulares
	}
	
}