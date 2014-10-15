package carmenSanDiegoUIs

import java.util.ArrayList
import java.util.HashSet
import java.util.Set
import mapamundi.Mapamundi
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import pais.Pais
import villano.Villano

@Observable
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