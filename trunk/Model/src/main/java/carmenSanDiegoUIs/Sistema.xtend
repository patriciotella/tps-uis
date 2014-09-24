package carmenSanDiegoUIs

import mapamundi.Mapamundi
import carmenSanDiegoUIs.Caso
import java.util.Set
import villano.Villano
import org.uqbar.commons.utils.Observable
import pais.Pais
import java.util.HashSet

@Observable
class Sistema {
	@Property Mapamundi mapamundi
	@Property Set<Villano> villanos
	@Property Caso caso
	private Villano villanoAcusado
	private Set<Pais> planDeEscape
	private Pais paisActual
	private Set<Pais> recorridoCriminal
	private Set<Pais> destinosFallidos
	
	val CASO_FACTORY = new CasoFactory
	
	Set<ObjetoRobado> posiblesObjetosRobados
	
	Pais paisAnterior
	
	new(Mapamundi mapamundi, Set<Villano> villanos, Set<ObjetoRobado> objetosRobados) {
		this._villanos = villanos
		this._mapamundi = mapamundi
		this.posiblesObjetosRobados = objetosRobados
	}
	
	def setRutas(Set<Pais> planDeEscape) {
		this.planDeEscape = planDeEscape
		recorridoCriminal = new HashSet
		destinosFallidos = new HashSet
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
	
	def emitirOrdenDeArresto(Villano unVillano) {
		villanoAcusado = unVillano
	}
	
	def getPaisActual() {
		paisActual
	}
	
	def viajarAlPaisAnterior() {
		paisActual = paisAnterior
	}
	
	def viajarAPais(Pais unPais) {
		paisAnterior = paisActual
		paisActual = unPais
	}
	
	/*No se me ocurre dónde hacer esta validación, puede ser cuando viaja 
	 * o cada vez que haces click en un lugar de interés así
	 * no sabés si la cagaste y recorrés los lugares de interés
	 */
	def determinarSiEstaEnUnPaisFallido() {
		if(planDeEscape.contains(paisActual))
			recorridoCriminal.add(paisActual)
		else
			destinosFallidos.add(paisActual)
	}
	
	def Villano getVillanoAcusado() {
		villanoAcusado
	}
	
}