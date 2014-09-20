package carmenSanDiegoUIs

import java.util.List
import villano.Villano
import pais.Pais
import org.uqbar.commons.utils.Observable

@Observable
class Caso {
	@Property Villano responsable
	@Property List<Pais> planDeEscape
	@Property String reporte
	@Property String objeto
	@Property Pais pais
	
	new () {
		planDeEscape = newArrayList
		reporte = ""
		objeto = ""
	}
	
	new (Villano villanoResponsable, List<Pais> planDeEscape, String reporte,
		String objetoRobado, Pais paisDondeOcurrio) {
		responsable = villanoResponsable
		this.planDeEscape = planDeEscape
		this.reporte = reporte
		objeto = objetoRobado
		pais = paisDondeOcurrio
		
		xxx(this.planDeEscape)
	}
	
	def xxx(List<Pais> paises) {
		//CAMBIAR EL NOMBRE!! 8=====D ~ ~~
		val finDelEscape = paises.get(paises.size - 1)
		val paisesMenosElUltimo = paises.filter[equals(finDelEscape)]
		paisesMenosElUltimo.forEach[marcarComoRutaDeEscapeDeVillano(responsable, paises.get(paises.indexOf(it)+1))]
		/*Marcar el finDelEscape como el último país de la ruta de escape
		 * (Todavía no se me ocurre una forma!)
		 */
	}

}