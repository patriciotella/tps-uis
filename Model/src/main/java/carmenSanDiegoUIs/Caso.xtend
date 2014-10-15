package carmenSanDiegoUIs

import java.util.Set
import pais.Pais
import villano.Villano

class Caso {
	@Property Villano responsable
	@Property Reporte reporte
	@Property ObjetoRobado objetoRobado
	@Property Pais paisDondeOcurrio
	Set<Pais> planDeEscape
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
	
	def getPlanDeEscape() {
		planDeEscape
	}

}