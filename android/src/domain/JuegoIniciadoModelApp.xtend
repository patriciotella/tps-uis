package domain

class JuegoIniciadoModelApp {
	
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