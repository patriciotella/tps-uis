package carmenSanDiegoUIs

import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import villano.Villano

@Observable
class ConfiguradorDeJuego {
	
	@Property Expediente expediente
	@Property Villano villanoSeleccionado
	
	
	new (Expediente expediente){
		_expediente = expediente
	}
	
	def agregarVillano(Villano unVillano){
//		_expediente.agregarVillano(unVillano)
		ObservableUtils.firePropertyChanged(this, "expediente", _expediente)
	}
	
	def isSeleccionoVillano() {
		_villanoSeleccionado != null
	}
	
	def setvillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
}