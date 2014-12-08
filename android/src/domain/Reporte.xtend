package domain

import java.io.Serializable

class Reporte implements Serializable {
	
	String descripcion
	
	new(Pais paisDondeOcurrioElRobo, ObjetoRobado objetoQueFueRobado) {
		this.descripcion = '''A las 9 de la mañana en «paisDondeOcurrioElRobo� la comunidad científica fue conmovida al darse cuenta del faltante
    de gran valor! «objetoQueFueRobado.descripcionCompleta�. El criminal
    fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective es descifrar el
    responsable de tal crimen y apresarlo.'''
	}
	
	def getDescripcion() {
		descripcion
	}
}