package carmenSanDiegoUIs

import villano.Villano
import pais.Pais
import java.util.Set
import java.util.HashSet
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class Juego {
	
	Villano villanoAcusado
	Pais paisActual
	Set<Pais> recorridoCriminal
	Set<Pais> destinosFallidos
	Pais paisAnterior
	Caso casoAResolver
	
	val casoFactory = new CasoFactory
	 
	new(Sistema unRepositorio){
		recorridoCriminal = new HashSet
		destinosFallidos = new HashSet
		casoAResolver =  casoFactory.crearCaso(unRepositorio)
		paisActual = casoAResolver.paisDondeOcurrio
	}
	
	def getPaisActual() {
		paisActual
	}
	
	def viajarAlPaisAnterior() {
		paisActual = paisAnterior
		ObservableUtils.firePropertyChanged(this, "paisActual", paisActual)
	}
	
	def viajarAPais(Pais unPais) {
		paisAnterior = paisActual
		paisActual = unPais
	}
	
	/*No se me ocurre dónde hacer esta validación, puede ser cuando viaja 
	 * o cada vez que haces click en un lugar de interés así
	 * no sabés si la cagaste y recorrés los lugares de interés
	 */
	
	
	def Villano getVillanoAcusado() {
		villanoAcusado
	}
	
	def getRecorridoCriminal() {
		recorridoCriminal
	}
	
	def isEmitioOrdenDeArresto() {
		villanoAcusado != null
	}
	
	def getPrimerLugarDeInteres() {
		this.paisActual.lugaresDeInteres.head
	}
	
	def getCaso() {
		casoAResolver
	}
	
	def determinarSiEstaEnUnPaisFallido() {
		casoAResolver.planDeEscape
	}
	
	def emitirOrdenContraVillano(Villano unVillano) {
		villanoAcusado = unVillano
	}
	
	def getDescripcionDelCaso() {
		casoAResolver.reporte.descripcion
	}
	
	def getPaisAnterior() {
		paisAnterior
	}
}