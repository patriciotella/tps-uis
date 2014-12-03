package domain

import java.util.List
import java.util.Set
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Juego implements Serializable {

	String villanoAcusado
	Pais paisActual
	Set<Pais> recorridoCriminal
	Set<Pais> destinosFallidos
	List<Pais> paisesAnteriores
	Caso casoAResolver
	int id

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
		if (villanoAcusado != null && villanoAcusado == caso.responsable.nombre)
			"Ganaste"
		else
			"Perdiste"
	}

//	def finalizar() {
//		new ResolucionDeJuegoModelApp(casoAResolver.nombre, casoAResolver.objetoRobado.nombre, villanoAcusado,
//			casoAResolver.responsable, resolucionDePartida)
//	}

}
