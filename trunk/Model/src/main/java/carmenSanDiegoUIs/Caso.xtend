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
	
	new (Villano villanoResponsable, Reporte reporteDelCaso,
			Pais paisDondeOcurrio, ObjetoRobado objetoRobado) {
		responsable = villanoResponsable
		this.paisDondeOcurrio = paisDondeOcurrio
		reporte = reporteDelCaso
		this.objetoRobado = objetoRobado
	}

}