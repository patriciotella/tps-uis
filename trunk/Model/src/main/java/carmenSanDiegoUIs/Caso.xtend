package carmenSanDiegoUIs

import java.util.List
import villano.Villano
import pais.Pais
import org.uqbar.commons.utils.Observable

@Observable
class Caso {
	@Property Villano responsable
	@Property List<Pais> planDeEscape
	@Property Reporte reporte
	@Property ObjetoRobado objeto
	@Property Pais pais
	
	new () {
		planDeEscape = newArrayList
//		reporte = ""
//		objeto = ""
	}
	
	new (Villano villanoResponsable, List<Pais> planDeEscape, Reporte reporteDelCaso,
		ObjetoRobado objetoRobado) {
		responsable = villanoResponsable
		this.planDeEscape = planDeEscape
		reporte = reporteDelCaso
		objeto = objetoRobado
	}

}