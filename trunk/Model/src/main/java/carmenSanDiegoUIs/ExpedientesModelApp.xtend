package carmenSanDiegoUIs

import java.util.Set
import villano.Villano

class ExpedientesModelApp {
	
	@Property
	Set<Villano> villanos
	
	@Property
	Villano villanoSeleccionado
	
	new(Set<Villano> villanos) {
		this.villanos = villanos
	}
	
	def agregarVillano(Villano unVillano) {
		_villanos.add(unVillano)
	}
	
	def eliminarVillano() {
		_villanos.remove(_villanoSeleccionado)
	}
	
	def isTieneVillanos() {
		!_villanos.empty
	}
	
	def isSeleccionoVillano() {
		_villanoSeleccionado != null
	}
	
	def setVillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
	}
	
	def getVillanos() {
		_villanos
	}
	
}