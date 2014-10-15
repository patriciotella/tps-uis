package carmenSanDiegoUIs

import pais.Pais
import java.util.Set
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class ViajarModelApp {
	
	Pais paisActual
	
	@Property
	Pais paisSeleccionado
	
	Set<Pais> posiblesPaises
	
	Juego juego
	
	new(Juego unJuego) {
		this.juego = unJuego
		this.paisActual = juego.paisActual
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
		juego.viajarAlPaisAnterior
		ObservableUtils.firePropertyChanged(this, "paisActual", paisActual)
	}
	
	def viajar() {
		juego.viajarAPais(_paisSeleccionado)
		ObservableUtils.firePropertyChanged(this, "paisActual", paisActual)
	}
	
	def isHayPaisAnterior(){
		juego.paisAnterior != null
	}
	
}