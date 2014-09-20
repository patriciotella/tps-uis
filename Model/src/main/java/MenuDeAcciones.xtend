

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Caso
import carmenSanDiegoUIs.Expediente

class MenuDeAcciones {
	@Property Mapamundi mapamundi
	@Property Expediente expedientes
	@Property Caso caso
	
	new(Mapamundi mapamundi, Expediente expedientes, Caso caso) {
		this._caso = caso
		this._expedientes = expedientes
		this._mapamundi = mapamundi
	}
	
	def void abrirCasoWindow(){
		
	}
	
	def void abrirExpedientesWindow() {
		
	}
	
	def void abrirMapamundiWindow() {
		
	}
}