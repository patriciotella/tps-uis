package domain

import java.util.Set
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Juego implements Serializable {

	String villanoAcusado
	Pais paisActual
	Set<Pais> recorridoCriminal
	Set<Pais> destinosFallidos
	Pais paisAnterior
	Caso casoAResolver
	String resolucionDePartida
	int id

	def determinarSiPerteneceAlRecorridoCriminal() {
		if (casoAResolver.planDeEscape.contains(paisActual)) {
			recorridoCriminal.add(paisActual)
		} else {
			destinosFallidos.add(paisActual)
		}
	}

	def String getVillanoAcusado() {
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

	def getDescripcionDelCaso() {
		casoAResolver.reporte.descripcion
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

//	def finalizar() {
//		new ResolucionDeJuegoModelApp(casoAResolver.nombre, casoAResolver.objetoRobado.nombre, villanoAcusado,
//			casoAResolver.responsable, resolucionDePartida)
//	}

}
