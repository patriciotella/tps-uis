package carmenSanDiegoUIs

import java.util.ArrayList
import villano.Villano
import pais.Pais
import villano.Expedientes
import java.util.HashMap
import java.util.Map

class ResolverMisterioModelApp {
	
	Expedientes expedientesDeVillanos
	
	Map<Integer, Juego> juegosEnCurso
	
	int proximoIdDeJuego
	
	new(Expedientes expedientes){
		expedientesDeVillanos = expedientes
		juegosEnCurso = new HashMap<Integer, Juego>
		proximoIdDeJuego = 0
//		juegoActual = new Juego(repositorio)
	}
	
	def getVillanos() {
		expedientesDeVillanos
	}
	
	def getNombreDelCaso(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.caso.nombre
	}
	
	def getLugaresDeInteresActuales(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		new ArrayList(juegoActual.paisActual.lugaresDeInteres)
	}
	
	def determinarSiEstaEnUnPaisFallido(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.determinarSiEstaEnUnPaisFallido
	}
	
	def getRecorridoCriminal(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.recorridoCriminal
	}
	
	def emitirOrdenDeArresto(int idDeJuego, Villano unVillano) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.emitirOrdenContraVillano(unVillano)
	}
	
	def getDescripcionDelCaso(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.descripcionDelCaso
	}

	def getPaisActual(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.paisActual
	}
	
	def isEmitioOrdenDeArresto(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.emitioOrdenDeArresto
	}
	
	def getVillanoAcusado(int idDeJuego) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.villanoAcusado
	}
	
	def iniciarJuego(Juego unJuego) {
		unJuego.id = proximoIdDeJuego
		juegosEnCurso.put(proximoIdDeJuego, unJuego)
		proximoIdDeJuego++
		return new JuegoIniciadoModelApp(unJuego, expedientesDeVillanos)
	}
	
	def getPistaDePaisActual(int id, String nombreDeLugarDeInteres) {
		val juegoActual = juegosEnCurso.get(id)
		juegoActual.getPistaDeLugarDeInteres(nombreDeLugarDeInteres)
	}
	
	def getVillano(String nombreDelVillano) {
		expedientesDeVillanos.getVillanoPorNombre(nombreDelVillano)
	}
	
	def getDestino(int idDeJuego, String nombreDelDestino) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.getDestinoPorNombre(nombreDelDestino)
	}
	
	def viajarADestino(int idDeJuego, Pais unPais) {
		val juegoActual = juegosEnCurso.get(idDeJuego)
		juegoActual.viajarAPais(unPais)
	}
	
	def getJuegoActual(int id) {
		juegosEnCurso.get(id)
	}
}