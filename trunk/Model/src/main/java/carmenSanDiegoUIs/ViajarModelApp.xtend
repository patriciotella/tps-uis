package carmenSanDiegoUIs

import pais.Pais
import java.util.Set
import org.uqbar.commons.model.ObservableUtils

class ViajarModelApp {
	
	Sistema sistema
	
	Pais paisActual
	
	@Property
	Pais paisSeleccionado
	
	Set<Pais> posiblesPaises
	
	new(Sistema unSistema) {
		this.sistema = unSistema
		this.paisActual = sistema.paisActual
		this.posiblesPaises = paisActual.conexiones
	}
	
	def isSeleccionoPais() {
		_paisSeleccionado != null
	}
	
	def setPaisSeleccionado(Pais unPais) {
		_paisSeleccionado = unPais
		ObservableUtils.firePropertyChanged(this, "seleccionoPais", seleccionoPais)
	}
	
	def getPosiblesPaises() {
		posiblesPaises
	}
	
	def getPaisActual() {
		paisActual
	}
	
	def viajarAlPaisAnterior() {
		sistema.viajarAlPaisAnterior
	}
	
	def viajar() {
		sistema.viajarAPais(_paisSeleccionado)
	}
	
}