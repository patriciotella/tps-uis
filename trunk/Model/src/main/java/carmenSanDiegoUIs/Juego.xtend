package carmenSanDiegoUIs

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import pais.Pais
import villano.Villano

class Juego {

	Villano villanoAcusado
	Pais paisActual
	Set<Pais> recorridoCriminal
	Set<Pais> destinosFallidos
	List<Pais> paisesAnteriores
	Caso casoAResolver
	int id

	val casoFactory = new CasoFactory

	new(Repositorio unRepositorio) {
		recorridoCriminal = new HashSet
		destinosFallidos = new HashSet
		paisesAnteriores = new ArrayList
		casoAResolver = casoFactory.crearCasoDefault(unRepositorio)
		paisActual = casoAResolver.paisDondeOcurrio
	}

	def getPaisActual() {
		paisActual
	}

	def viajarAlPaisAnterior() {
		paisActual = paisesAnteriores.last
		paisesAnteriores.remove(paisesAnteriores.size - 1)
	}

	def viajarAPais(Pais unPais) {
		paisesAnteriores.add(paisActual)
		paisActual = unPais
		determinarSiPerteneceAlRecorridoCriminal
	}

	def determinarSiPerteneceAlRecorridoCriminal() {
		if (casoAResolver.planDeEscape.contains(paisActual)) {
			recorridoCriminal.add(paisActual)
		} else {
			destinosFallidos.add(paisActual)
		}
	}

	def Villano getVillanoAcusado() {
		villanoAcusado
	}

	def getRecorridoCriminal() {
		recorridoCriminal
	}

	def getDestinosFallidos() {
		destinosFallidos
	}

	def isEmitioOrdenDeArresto() {
		villanoAcusado != null
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
		paisesAnteriores.last
	}

	def getPistaDeLugarDeInteres(String nombreLugarDeInteres) {
		paisActual.getPistaDeLugar(nombreLugarDeInteres)
	}

	def getDestinoPorNombre(String nombreDelDestino) {
		paisActual.conexiones.filter[nombre == nombreDelDestino].head
	}

	def setId(int unId) {
		id = unId
	}

	def getId() {
		id
	}

	def getResolucionDePartida() {
		if (villanoAcusado != null && villanoAcusado.nombre == caso.responsable.nombre)
			"Ganaste"
		else
			"Perdiste"
	}

	def finalizar() {
		new ResolucionDeJuegoModelApp(casoAResolver.nombre, casoAResolver.objetoRobado.nombre, villanoAcusado,
			casoAResolver.responsable, resolucionDePartida)
	}

}
