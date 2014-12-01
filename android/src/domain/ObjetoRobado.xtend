package domain

import java.io.Serializable

class ObjetoRobado implements Serializable {
	private String nombre
	private String descripcion
	
	new(String nombreDelObjeto, String descripcionDelObjeto) {
		nombre = nombreDelObjeto
		this.descripcion = descripcionDelObjeto
	}
	
	def getNombre() {
		nombre
	}
	
	def getDescripcionCompleta() {
		descripcion
	}
}