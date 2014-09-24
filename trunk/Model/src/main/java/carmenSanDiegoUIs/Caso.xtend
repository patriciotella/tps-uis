package carmenSanDiegoUIs

import villano.Villano
import pais.Pais
import org.uqbar.commons.utils.Observable

@Observable
class Caso {
	@Property Villano responsable
	@Property Reporte reporte
	@Property ObjetoRobado objetoRobado
	@Property Pais paisDondeOcurrio
	
	String nombre
	
	new (String nombre, Villano villanoResponsable, Reporte reporteDelCaso,
			Pais paisDondeOcurrio, ObjetoRobado objetoRobado) {
		this.nombre = nombre
		responsable = villanoResponsable
		this.paisDondeOcurrio = paisDondeOcurrio
		reporte = reporteDelCaso
		this.objetoRobado = objetoRobado
	}
	
	def getNombre() {
		nombre
	}

}