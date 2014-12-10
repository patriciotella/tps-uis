package domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LugarDeInteres implements Serializable {
	
	Pais pais
	String nombre
	
	protected new() {
		this.nombre = this.class.toString.substring(21)
	}
	
	override toString() {
		nombre
	}
	
	def getNombre() {
		nombre
	}
	
}