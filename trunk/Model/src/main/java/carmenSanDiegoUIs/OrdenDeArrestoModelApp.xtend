package carmenSanDiegoUIs

import java.util.Set
import villano.Villano
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class OrdenDeArrestoModelApp {
	
	Sistema unSistema
	Set<Villano> villanos
	@Property
	Villano villanoSeleccionado
	
	new(Sistema unSistema) {
		this.unSistema = unSistema
		villanos = unSistema.villanos
	}
	
	def emitirOrdenDeArresto() {
		unSistema.emitirOrdenDeArresto(villanoSeleccionado)
	}
	
	def isSeleccionoVillano() {
		villanoSeleccionado != null
	}
	
	def setVillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
	}
}