package carmenSanDiegoUIs

import villano.Villano

class ResolucionDeJuegoModelApp {

	String nombreDelCaso
	String nombreDelObjetoRobado
	String villanoAcusado
	String culpableDelRobo
	String resolucionDePartida

	new(String nombreDeUnCaso, String nombreDelObjetoRobadoEnElcaso, Villano villanoAcusadoPorJugador,
		Villano villanoResponsableDelRobo, String resultadoDePartida) {
			nombreDelCaso = nombreDeUnCaso
			nombreDelObjetoRobado = nombreDelObjetoRobadoEnElcaso
			if(villanoAcusadoPorJugador != null)
				villanoAcusado = villanoAcusadoPorJugador.nombre
			culpableDelRobo = villanoResponsableDelRobo.nombre
			resolucionDePartida = resultadoDePartida
	}
	
	def getNombreDelCaso() {
		nombreDelCaso
	}
	
	def getNombreDelObjetoRobado() {
		nombreDelObjetoRobado
	}
	
	def getVillanoAcusado() {
		villanoAcusado
	}
	
	def getCulpableDelRobo() {
		culpableDelRobo
	}
	
	def getResolucionDePartida() {
		resolucionDePartida
	}
	
}
