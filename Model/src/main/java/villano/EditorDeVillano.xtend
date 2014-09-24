package villano

import org.uqbar.commons.utils.Observable
import carmenSanDiegoUIs.ExpedientesModelApp
import java.util.Set
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import java.util.HashSet

@Observable
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
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def eliminarHobbie(String unHobbie) {
		_hobbies.remove(unHobbie)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def eliminarSeniaPArticular(String unaSenia) {
		_seniasParticulares.remove(unaSenia)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}
	
	def agregarSeniaParticular(String unaSenia) {
		_seniasParticulares.add(unaSenia)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}
	
	def getSexos() {
		this.sexos
	}
}