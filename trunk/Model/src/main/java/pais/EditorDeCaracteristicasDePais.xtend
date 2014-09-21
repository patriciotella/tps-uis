package pais

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeCaracteristicasDePais {
	
	@Property EditorDePais pais
	@Property String caracteristicaNueva
	@Property String caracteristicaSeleccionada
	
	new(EditorDePais pais){
		this._pais = pais
	}
	
	def agregarCaracteristica() {
		this.pais.agregarCaracteristica(caracteristicaNueva)
		_caracteristicaNueva = null
		ObservableUtils.firePropertyChanged(this, "puedeEliminarCaracteristica", puedeEliminarCaracteristica)
		ObservableUtils.firePropertyChanged(this, "hayCaracteristicaParaAgregar", hayCaracteristicaParaAgregar)
	}
	
	def borrarCaracteristica() {
		this.pais.borrarCaracteristica(caracteristicaSeleccionada)
		ObservableUtils.firePropertyChanged(this, "puedeEliminarCaracteristica", puedeEliminarCaracteristica)
	}
	
	def isHayCaracteristicaParaAgregar() {
		_caracteristicaNueva != null && _caracteristicaNueva != ""
	}
	
	def setCaracteristicaNueva(String unaCaracteristica) {
		_caracteristicaNueva = unaCaracteristica
		ObservableUtils.firePropertyChanged(this, "hayCaracteristicaParaAgregar", hayCaracteristicaParaAgregar)
	}
	
	def setCaracteristicaSeleccionada(String unaCaracteristica) {
		_caracteristicaSeleccionada = unaCaracteristica
		ObservableUtils.firePropertyChanged(this, "puedeEliminarCaracteristica", puedeEliminarCaracteristica)
	}
	
	def isPuedeEliminarCaracteristica() {
		_caracteristicaSeleccionada != null && pais.caracteristicas.size > 0
	}
}