package lugarDeInteres 
import pais.Pais
import villano.Villano
import java.util.List

abstract class LugarDeInteres {
	
	private Ocupante ocupante
	private Pais proximoPaisDondeFueElMalechor
	private Villano villano
	
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
	
	def protected List<String> darPista()
	
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
	}
	
	def noConoceAlVillano() {
		villano = null
		proximoPaisDondeFueElMalechor = null
		ocupante = new Cuidador
	}
	
}