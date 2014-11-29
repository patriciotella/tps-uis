package domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Caso {
	Villano responsable
	Reporte reporte
	ObjetoRobado objetoRobado
	Pais paisDondeOcurrio
	Set<Pais> planDeEscape
	String nombre
	
	new (String nombre, Villano villanoResponsable, Reporte reporteDelCaso,
			Pais paisDondeOcurrio, ObjetoRobado objetoRobado, Set<Pais> planDeEscape) {
		this.nombre = nombre
		responsable = villanoResponsable
		this.paisDondeOcurrio = paisDondeOcurrio
		reporte = reporteDelCaso
		this.objetoRobado = objetoRobado
		this.planDeEscape = planDeEscape
	}
	
	def getNombre() {
		nombre
	}
	
	def getPlanDeEscape() {
		planDeEscape
	}

}