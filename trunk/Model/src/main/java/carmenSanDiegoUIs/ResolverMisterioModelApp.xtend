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
		getJuegoValido(idDeJuego).emitirOrdenContraVillano(unVillano)
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
		val pista = getJuegoValido(id).getPistaDeLugarDeInteres(nombreDeLugarDeInteres)
		if(pista == null)
			throw new JuegoException("El lugar de interes no existe")
		
		pista
	}
	
	def getVillano(String nombreDelVillano) {
		val villano = expedientesDeVillanos.getVillanoPorNombre(nombreDelVillano)
		if(villano == null)
			throw new JuegoException("No existe el villano")
			
		villano
	}
	
	def getDestino(int idDeJuego, String nombreDelDestino) {
		val destino = getJuegoValido(idDeJuego).getDestinoPorNombre(nombreDelDestino)
		if(destino == null)
			throw new JuegoException("No existe el destino")
			
		destino
	}
	
	def viajarADestino(int idDeJuego, Pais unPais) {
		getJuegoValido(idDeJuego).viajarAPais(unPais)
	}
	
	def getJuegoActual(int id) {
		getJuegoValido(id)
	}
	
	def finalizarPartida(int idDeJuego) {
		val juego = getJuegoValido(idDeJuego).finalizar
		juegosEnCurso.remove(idDeJuego)
		return juego
	}
	
	def viajarAlPaisAnterior(int idDeJuego) {
		getJuegoValido(idDeJuego).viajarAlPaisAnterior
	}
	
	def getJuegoValido(int idDeJuego){
		val juegoActual = juegosEnCurso.get(idDeJuego)
		if(juegoActual == null)
			throw new JuegoException("Juego no existente")
		return juegoActual
	}
}