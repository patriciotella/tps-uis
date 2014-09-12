

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Expedientes
import carmenSanDiegoUIs.Caso

class MenuDeAcciones {
	@Property Mapamundi mapamundi
	@Property Expedientes expedientes
	@Property Caso caso
	
	new(Mapamundi mapamundi, Expedientes expedientes, Caso caso) {
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