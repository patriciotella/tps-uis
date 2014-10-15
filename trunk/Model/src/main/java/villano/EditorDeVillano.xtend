package villano

import carmenSanDiegoUIs.ExpedientesModelApp
import java.util.HashSet
import java.util.List
import java.util.Set

class EditorDeVillano {
	
	private List<String> sexos = #["Masculino", "Femenino"]
	private Villano villano
	@Property ExpedientesModelApp expedientes
	
	@Property String nombre
	@Property String sexo
	@Property Set<String> hobbies
	@Property Set<String> seniasParticulares
	
	new(Villano unVillano, ExpedientesModelApp expedientes){
		_expedientes = expedientes
		villano = unVillano
		_nombre = unVillano.nombre
		_sexo = unVillano.sexo
		_hobbies = new HashSet(unVillano.hobbies)
		_seniasParticulares = new HashSet(unVillano.seniasParticulares)
	}
	
	new(ExpedientesModelApp expedientes) {
		_expedientes = expedientes
		_nombre = ""
		_sexo = ""
		_hobbies = newHashSet
		_seniasParticulares = newHashSet
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
	}
	
	def eliminarHobbie(String unHobbie) {
		_hobbies.remove(unHobbie)
	}
	
	def eliminarSeniaPArticular(String unaSenia) {
		_seniasParticulares.remove(unaSenia)
	}
	
	def agregarSeniaParticular(String unaSenia) {
		_seniasParticulares.add(unaSenia)
	}
	
	def getSexos() {
		this.sexos
	}
}