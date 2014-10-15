package carmenSanDiegoUIs

import java.util.ArrayList
import villano.Villano

class ResolverMisterioModelApp {
	
	Sistema repositorio
	
	@Property Juego juegoActual
	
	new(Sistema unRepositorio){
		repositorio = unRepositorio
		juegoActual = new Juego(repositorio)
	}
	
	def villanos() {
		repositorio.villanos
	}
	
	def getNombreDelCaso() {
		juegoActual.caso.nombre
	}
	
	def getLugaresDeInteresActuales() {
		new ArrayList(juegoActual.paisActual.lugaresDeInteres)
	}
	
	def getPrimerLugarDeInteres() {
		getLugarDeInteres(0)
	}
	
	def getSegundoLugarDeInteres() {
		getLugarDeInteres(1)
	}
	
	def getTercerLugarDeInteres() {
		getLugarDeInteres(2)
	}
	
	def private getLugarDeInteres(int indiceDelLugar) {
		lugaresDeInteresActuales.get(indiceDelLugar)
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
		_juegoActual.villanoAcusado
	}
}