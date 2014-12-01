package domain

import java.io.Serializable

class JuegoIniciadoModelApp implements Serializable {
	
	Juego juegoActual
	Expedientes expedientes
	
	new(Juego unJuego, Expedientes expedientesDeVillanos){
		juegoActual = unJuego
		expedientes = expedientesDeVillanos
	}
	
	def getJuegoActual(){
		juegoActual
	}
	
	def getExpedientesDeVillanos() {
		expedientes
	}
}