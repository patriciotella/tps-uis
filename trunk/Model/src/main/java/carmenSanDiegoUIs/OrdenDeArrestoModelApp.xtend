package carmenSanDiegoUIs

import java.util.Set
import villano.Villano

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
	}
	
	def getVillanos() {
		villanos
	}
}