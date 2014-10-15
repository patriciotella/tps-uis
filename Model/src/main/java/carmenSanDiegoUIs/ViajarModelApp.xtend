package carmenSanDiegoUIs

import java.util.Set
import pais.Pais

class ViajarModelApp {
	
	Pais paisActual
	
	@Property
	Pais paisSeleccionado
	
	Set<Pais> posiblesPaises
	
	Juego juego
	
	new(Juego unJuego) {
		this.juego = unJuego
		this.paisActual = juego.paisActual
		this.posiblesPaises = paisActual.conexiones
	}
	
	def isSeleccionoPais() {
		_paisSeleccionado != null
	}
	
	def setPaisSeleccionado(Pais unPais) {
		_paisSeleccionado = unPais
	}
	
	def getPosiblesPaises() {
		posiblesPaises
	}
	
	def getPaisActual() {
		paisActual
	}
	
	def viajarAlPaisAnterior() {
		juego.viajarAlPaisAnterior
	}
	
	def viajar() {
		juego.viajarAPais(_paisSeleccionado)
	}
	
	def isHayPaisAnterior(){
		juego.paisAnterior != null
	}
	
}