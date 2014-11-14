package villano

import java.util.HashSet
import java.util.List
import java.util.Set
import java.io.Serializable

class EditorDeVillano implements Serializable{
	
	private List<String> sexos = #["Masculino", "Femenino"]
	private Villano villano
	@Property Expedientes expedientes
	
	@Property String nombre
	@Property String sexo
	@Property Set<String> hobbies
	@Property Set<String> seniasParticulares
	@Property String seniaNueva
	@Property String hobbieNuevo
	@Property String hobbieSeleccionado
	@Property String seniaSeleccionada
	
	new(Villano unVillano, Expedientes expedientes){
		_expedientes = expedientes
		villano = unVillano
		_nombre = unVillano.nombre
		_sexo = unVillano.sexo
		_hobbies = new HashSet(unVillano.hobbies)
		_seniasParticulares = new HashSet(unVillano.seniasParticulares)
	}
	
	new(Expedientes expedientes) {
		_expedientes = expedientes
		_nombre = ""
		_sexo = ""
		_hobbies = new HashSet
		_seniasParticulares = new HashSet
	}
	
	def agregarVillano(){
		val villanoParaAgregar = new Villano(_nombre, _sexo, _seniasParticulares, _hobbies)
		if(villano == null){
			villano = villanoParaAgregar
			this._expedientes.agregarVillano(villano)
		}else{
			villano.syncWith(villanoParaAgregar)
		}
	}
	
	def puedeCrearVillano(){
		villano.nombre!=""
	}
	
	def agregarHobbie(String unHobbie) {
		_hobbies.add(unHobbie)
		_hobbieNuevo = ""
	}
	
	def eliminarHobbie(String unHobbie) {
		_hobbies.remove(unHobbie)
	}
	
	def eliminarSeniaParticular(String unaSenia) {
		_seniasParticulares.remove(unaSenia)
	}
	
	def agregarSeniaParticular(String unaSenia) {
		_seniasParticulares.add(unaSenia)
		_seniaNueva = ""
	}
	
	def getSexos() {
		this.sexos
	}
	
	def getHobbies() {
		_hobbies.toList
	}
	
	def getSeniasParticulares() {
		_seniasParticulares.toList
	}
	
	def void sincWith(Villano unVillano, Expedientes expedientes) {
		_expedientes = expedientes
		this.villano = unVillano
		_nombre = unVillano.nombre
		_sexo = unVillano.sexo
		_hobbies = new HashSet(unVillano.hobbies)
		_seniasParticulares = new HashSet(unVillano.seniasParticulares)
		_seniaNueva = ""
		_hobbieNuevo = ""
		_hobbieSeleccionado = ""
		_seniaSeleccionada = ""
	}
	
}