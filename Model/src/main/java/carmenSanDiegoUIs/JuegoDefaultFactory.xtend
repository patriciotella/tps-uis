package carmenSanDiegoUIs

class JuegoDefaultFactory {
	
	def static getJuegoDefault(Repositorio repositorio) {
		new Juego(repositorio)
	}
}