package carmenSanDiegoUIs

import java.util.Set
import mapamundi.Mapamundi
import villano.Villano

class Sistema {
	@Property Mapamundi mapamundi
	@Property Set<Villano> villanos
	Set<ObjetoRobado> posiblesObjetosRobados
	
	new(Mapamundi mapamundi, Set<Villano> villanos, Set<ObjetoRobado> objetosRobados) {
		this._villanos = villanos
		this._mapamundi = mapamundi
		this.posiblesObjetosRobados = objetosRobados
	}
	
	def getPosiblesObjetosRobados() {
		posiblesObjetosRobados
	}
}