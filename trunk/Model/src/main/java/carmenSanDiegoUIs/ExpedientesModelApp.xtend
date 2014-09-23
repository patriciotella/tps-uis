package carmenSanDiegoUIs

import villano.Villano
import java.util.Set
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class ExpedientesModelApp {
	
	@Property
	Set<Villano> villanos
	
	@Property
	Villano villanoSeleccionado
	
	new() {
		villanos = newHashSet
	}
	
	def agregarVillano(Villano unVillano) {
		_villanos.add(unVillano)
		ObservableUtils.firePropertyChanged(this, "villanos", villanos)
		ObservableUtils.firePropertyChanged(this, "tieneVillanos", tieneVillanos)
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
	
	def eliminarVillano() {
		_villanos.remove(_villanoSeleccionado)
		ObservableUtils.firePropertyChanged(this, "villanos", villanos)
		ObservableUtils.firePropertyChanged(this, "tieneVillanos", tieneVillanos)
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
	
	def isTieneVillanos() {
		!_villanos.empty
	}
	
	def isSeleccionoVillano() {
		_villanoSeleccionado != null
	}
	
	def setVillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
	
	def getVillanos() {
		_villanos
	}
	
}