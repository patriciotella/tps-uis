package carmenSanDiegoUIs

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Caso
import java.util.Set
import villano.Villano
import org.uqbar.commons.utils.Observable

@Observable
class MenuDeAcciones {
	@Property Mapamundi mapamundi
	@Property Set<Villano> villanos
	@Property Set<Caso> caso
	
	new(Mapamundi mapamundi, Set<Villano> villanos, Set<Caso> caso) {
		this._caso = caso
		this._villanos = villanos
		this._mapamundi = mapamundi
	}

}