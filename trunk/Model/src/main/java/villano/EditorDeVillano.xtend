package villano

import carmenSanDiegoUIs.Expediente
import org.uqbar.commons.utils.Observable

@Observable
class EditorDeVillano {
	
	@Property Villano villano
	@Property Expediente expediente
	
	new(Villano unVillano, Expediente unExpediente){
		villano = unVillano
		expediente = unExpediente
	}
	
	def agregarVillano(Villano unVillano){
		expediente.agregarVillano(unVillano)
		
	}
	
	def puedeCrearVillano(){
		villano.nombre!=""
	}
}