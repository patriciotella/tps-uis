package lugarDeInteres 
import pais.Pais
import villano.Villano
import java.util.List

abstract class LugarDeInteres {
	
	private LugarNoConoceAlMalechor estado
	private Pais proximoLugarDondeFueElMalechor
	private Villano villano
	
	def protected LugarDeInteres() {
		this.estado = new LugarNoConoceAlMalechor()
	}
	
	override toString() {
		this.class.toString.substring(21)
	}
	
	def List<String> pista() {
		estado.pista(this)
	}
	
	def getEstado() {
		estado
	}
	
	def List<String> darPista()
	
	def getVillano() {
		villano
	}
	
	def getPais() {
		proximoLugarDondeFueElMalechor
	}
}