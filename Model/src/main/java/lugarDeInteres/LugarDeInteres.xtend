package lugarDeInteres 
import pais.Pais
import villano.Villano

abstract class LugarDeInteres {
	
	private Ocupante ocupante
	private Pais proximoPaisDondeFueElMalechor
	private Villano villano
	private EstadoDeLugarDeInteres estado
	
	protected new() {
		this.ocupante = new Cuidador()
	}
	
	override toString() {
		this.class.toString.substring(21)
	}
	
	def pista() {
		ocupante.pista(this)
	}
	
	def getEstado() {
		ocupante
	}
	
	def protected String darPista() {
		estado.pista(this)
	}
	
	def protected abstract String darPistaSegunPolitica()
	
	def getVillano() {
		villano
	}
	
	def getPais() {
		proximoPaisDondeFueElMalechor
	}
	
	def marcarComoRutaDeEscapeDeVillano(Villano unVillano, Pais siguientePais) {
		villano = unVillano
		proximoPaisDondeFueElMalechor = siguientePais
		ocupante = new Informante
		estado = new ElVillanoPasoPorElPais
	}
	
	def noConoceAlVillano() {
		villano = null
		proximoPaisDondeFueElMalechor = null
		ocupante = new Cuidador
	}
	
	def marcarComoEsconditeDelVillano(Villano unVillano) {
		villano = unVillano
		proximoPaisDondeFueElMalechor = null
		estado = new LugarEscondeAlVillano
	}
	
	def elVillanoEstaEnElPais(Villano unVillano) {
		villano = unVillano
		proximoPaisDondeFueElMalechor = null
		estado = new ElVillanoEstaEnElPais
	} 
	
}