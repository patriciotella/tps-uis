package carmenSanDiegoUIs

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Caso
import java.util.Set
import villano.Villano
import org.uqbar.commons.utils.Observable
import pais.Pais
import java.util.List

@Observable
class Sistema {
	@Property Mapamundi mapamundi
	@Property Set<Villano> villanos
	@Property Caso caso
	private Villano villanoAcusado
	private Set<Pais> planDeEscape
	private Pais paisActual
	private Set<Pais> recorridoCriminal
	private List<Pais> destinosFallados
	
	val CASO_FACTORY = new CasoFactory
	
	Set<ObjetoRobado> posiblesObjetosRobados
	
	new(Mapamundi mapamundi, Set<Villano> villanos, Set<ObjetoRobado> objetosRobados) {
		this._villanos = villanos
		this._mapamundi = mapamundi
		this.posiblesObjetosRobados = objetosRobados
	}
	
	def setRutaDeEscape(Set<Pais> planDeEscape) {
		this.planDeEscape = planDeEscape
	}

	def guardarOrdenDeArrestoParaVillano(Villano unVillano) {
		villanoAcusado = unVillano
	}
	
	def crearCaso(){
		val indiceDeObjetoRobado = (Math.random() * (posiblesObjetosRobados.size - 0)).intValue
		val caso = CASO_FACTORY.crearCaso(this, posiblesObjetosRobados.get(indiceDeObjetoRobado))
		this._caso = caso
		this.paisActual = _caso.paisDondeOcurrio
	}
}