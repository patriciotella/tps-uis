package carmenSanDiegoUIs

import java.util.ArrayList
import villano.Villano
import pais.Pais
import villano.Expedientes

class ResolverMisterioModelApp {
	
	Expedientes expedientesDeVillanos
	
	Juego juegoActual
	
	new(Expedientes expedientes){
		expedientesDeVillanos = expedientes
//		juegoActual = new Juego(repositorio)
	}
	
	def getVillanos() {
		expedientesDeVillanos
	}
	
	def getNombreDelCaso() {
		juegoActual.caso.nombre
	}
	
	def getLugaresDeInteresActuales() {
		new ArrayList(juegoActual.paisActual.lugaresDeInteres)
	}
	
	def determinarSiEstaEnUnPaisFallido() {
		juegoActual.determinarSiEstaEnUnPaisFallido
	}
	
	def getRecorridoCriminal() {
		juegoActual.recorridoCriminal
	}
	
	def emitirOrdenDeArresto(Villano unVillano) {
		juegoActual.emitirOrdenContraVillano(unVillano)
	}
	
	def getDescripcionDelCaso() {
		juegoActual.descripcionDelCaso
	}

	def getPaisActual() {
		juegoActual.paisActual
	}
	
	def isEmitioOrdenDeArresto() {
		juegoActual.emitioOrdenDeArresto
	}
	
	def getVillanoAcusado() {
		juegoActual.villanoAcusado
	}
	
	def iniciarJuego(Juego unJuego) {
		juegoActual = unJuego
	}
	
	def getPistaDePaisActual(String nombreDeLugarDeInteres) {
		juegoActual.getPistaDeLugarDeInteres(nombreDeLugarDeInteres)
	}
	
	def getVillano(String nombreDelVillano) {
		expedientesDeVillanos.getVillanoPorNombre(nombreDelVillano)
	}
	
	def getDestino(String nombreDelDestino) {
		juegoActual.getDestinoPorNombre(nombreDelDestino)
	}
	
	def viajarADestino(Pais unPais) {
		juegoActual.viajarAPais(unPais)
	}
	
	def getJuegoActual() {
		juegoActual
	}
}