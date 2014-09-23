package lugarDeInteres 
import pais.Pais
import villano.Villano
import java.util.List

abstract class LugarDeInteres {
	
	private EstadoDelLugar estado
	private Pais proximoPaisDondeFueElMalechor
	private Villano villano
	
	def protected LugarDeInteres() {
		this.estado = new LugarNoConoceAlMalechor()
	}
	
	override toString() {
		this.class.toString.substring(21)
	}
	
	def pista() {
		estado.pista(this)
	}
	
	def getEstado() {
		estado
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
		estado = new LugarConoceAlMalechor
	}
	
	def marcarComoEsconditeDeVillano(Villano unVillano) {
		villano = unVillano
		proximoPaisDondeFueElMalechor = null
		estado = new LugarContieneAlVillano
	}
	
	def noConoceAlVillano() {
		villano = null
		proximoPaisDondeFueElMalechor = null
		estado = new LugarNoConoceAlMalechor
	}
	
}