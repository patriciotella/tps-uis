package carmenSanDiegoUIs

import java.util.Set
import mapamundi.Mapamundi
import villano.Expedientes
import villano.Villano

class Repositorio {
	@Property Mapamundi mapamundi
	@Property Expedientes expedientes
	Set<ObjetoRobado> posiblesObjetosRobados

	new(Mapamundi mapamundi, Expedientes expedientes, Set<ObjetoRobado> objetosRobados) {
		this._expedientes = expedientes
		this._mapamundi = mapamundi
		this.posiblesObjetosRobados = objetosRobados
	}

	def getPosiblesObjetosRobados() {
		posiblesObjetosRobados
	}
	
	def Villano getVillano(String nombreDeVillano) {
		expedientes.getVillanoPorNombre(nombreDeVillano)
	}
	
	def getVillanos() {
		expedientes.villanos
	}
	
	def getPaises() {
		mapamundi.paises
	}
}
