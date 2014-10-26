package carmenSanDiegoUIs

import java.util.Set
import villano.Villano

class OrdenDeArrestoModelApp {
	
	ResolverMisterioModelApp juego
	@Property
	Villano villanoSeleccionado
	
	new(ResolverMisterioModelApp modeloDeJuego) {
		juego = modeloDeJuego
	}
	
	def emitirOrdenDeArresto() {
//		juego.emitirOrdenDeArresto(villanoSeleccionado)
	}
	
	def isSeleccionoVillano() {
		villanoSeleccionado != null
	}
	
	def setVillanoSeleccionado(Villano unVillano) {
		_villanoSeleccionado = unVillano
	}
}