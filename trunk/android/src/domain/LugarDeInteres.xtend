package domain

import java.io.Serializable

abstract class LugarDeInteres implements Serializable {
	
//	@Property Ocupante ocupante
	private Pais proximoPaisDondeFueElMalechor
	private Villano villano
//	private EstadoDeLugarDeInteres estado
	private String nombre
	
	protected new() {
//		this.ocupante = new Cuidador()
		this.nombre = this.class.toString.substring(21)
	}
	
	override toString() {
		nombre
	}
	
	def getNombre() {
		nombre
	}
	
	def pista() {
//		_ocupante.pista(this)
	}
	
	def getEstado() {
//		ocupante
	}
	
	def protected String darPista() {
//		estado.pista(this)
	}
	
	def protected abstract String darPistaSegunPolitica()
	
	def getVillano() {
		villano
	}
	
	def getPais() {
		proximoPaisDondeFueElMalechor
	}
	
}