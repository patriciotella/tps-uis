package carmenSanDiegoUIs

import java.util.HashSet
import java.util.Set
import pais.Pais
import villano.Villano

class Juego {
	
	Villano villanoAcusado
	Pais paisActual
	Set<Pais> recorridoCriminal
	Set<Pais> destinosFallidos
	Pais paisAnterior
	Caso casoAResolver
	
	val casoFactory = new CasoFactory
	 
	new(Repositorio unRepositorio){
		recorridoCriminal = new HashSet
		destinosFallidos = new HashSet
		casoAResolver =  casoFactory.crearCasoDefault(unRepositorio)
		paisActual = casoAResolver.paisDondeOcurrio
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
	
	def getPistaDeLugarDeInteres(String nombreLugarDeInteres) {
		paisActual.getPistaDeLugar(nombreLugarDeInteres)
	}
	
	def getDestinoPorNombre(String nombreDelDestino) {
		paisActual.conexiones.filter[nombre == nombreDelDestino].head
	}
	
}