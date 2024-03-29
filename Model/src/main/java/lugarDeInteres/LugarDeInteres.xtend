package lugarDeInteres 
import pais.Pais
import villano.Villano

abstract class LugarDeInteres {
	
	@Property Ocupante ocupante
	private Pais proximoPaisDondeFueElMalechor
	private Villano villano
	private EstadoDeLugarDeInteres estado
	private String nombre
	
	protected new() {
		this.ocupante = new Cuidador()
		this.nombre = this.class.toString.substring(21)
	}
	
	override toString() {
		nombre
	}
	
	def getNombre() {
		nombre
	}
	
	def pista() {
		_ocupante.pista(this)
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
		ocupante = new CuidadorDeEsconditeDeVillano
		estado = new LugarEscondeAlVillano
	}
	
	def elVillanoEstaEnElPais(Villano unVillano) {
		villano = unVillano
		proximoPaisDondeFueElMalechor = null
		ocupante = new CuidadorDeEsconditeDeVillano
		estado = new ElVillanoEstaEnElPais
	} 
	
}