package carmenSanDiegoUIs

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Caso
import carmenSanDiegoUIs.Expediente
import java.util.Set

class MenuDeAcciones {
	@Property Mapamundi mapamundi
	@Property Set<Expediente> expedientes
	@Property Set<Caso> caso
	
	new(Mapamundi mapamundi, Set<Expediente> expedientes, Set<Caso> caso) {
		this._caso = caso
		this._expedientes = expedientes
		this._mapamundi = mapamundi
	}

}