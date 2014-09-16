package carmenSanDiegoUIs

import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import villano.Villano

@Observable
class ConfiguradorDeJuego {
	
	@Property Expedientes expedientes
	@Property Villano villanoSeleccionado
	
	
	new (Expedientes expedientes){
		this._expedientes = expedientes
	}
	
	def agregarVillano(Villano unVillano){
		this._expedientes.agregarVillano(unVillano)
		ObservableUtils.firePropertyChanged(this, "expedientes", _expedientes)
	}
	
	def isSeleccionoVillano() {
		_villanoSeleccionado != null
	}
	
	def setvillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
}