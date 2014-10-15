package carmenSanDiegoUIs

import java.util.Set
import villano.Villano
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class OrdenDeArrestoModelApp {
	
	ResolverMisterioModelApp juego
	Set<Villano> villanos
	@Property
	Villano villanoSeleccionado
	
	new(ResolverMisterioModelApp modeloDeJuego) {
		juego = modeloDeJuego
		villanos = juego.villanos
	}
	
	def emitirOrdenDeArresto() {
		juego.emitirOrdenDeArresto(villanoSeleccionado)
	}
	
	def isSeleccionoVillano() {
		villanoSeleccionado != null
	}
	
	def setVillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
		ObservableUtils.firePropertyChanged(this, "seleccionoVillano", seleccionoVillano)
		ObservableUtils.firePropertyChanged(this, "villanoSeleccionado", villanoSeleccionado)
	}
	
	def getVillanos() {
		villanos
	}
}