package pais

class EditorDeCaracteristicasDePais {
	
	@Property EditorDePais editor
	@Property String caracteristicaNueva
	@Property String caracteristicaSeleccionada
	
	new(EditorDePais pais){
		this._editor = pais
	}
	
	def agregarCaracteristica() {
		_editor.agregarCaracteristica(caracteristicaNueva)
		_caracteristicaNueva = null
		cambioLaListaDeCaracteristicasParaEliminar()
	}
	
	def borrarCaracteristica() {
		_editor.borrarCaracteristica(caracteristicaSeleccionada)
		cambioLaListaDeCaracteristicasParaEliminar()
	}
	
	def isHayCaracteristicaParaAgregar() {
		_caracteristicaNueva != null && _caracteristicaNueva != ""
	}
	
	def setCaracteristicaNueva(String unaCaracteristica) {
		_caracteristicaNueva = unaCaracteristica
	}
	
	def setCaracteristicaSeleccionada(String unaCaracteristica) {
		_caracteristicaSeleccionada = unaCaracteristica
		cambioLaListaDeCaracteristicasParaEliminar()
	}
	
	def isPuedeEliminarCaracteristica() {
		_caracteristicaSeleccionada != null && getEditor.caracteristicas.size > 0
	}
	
	def getCaracteristicas() {
		_editor.caracteristicas
	}
	
	def cambioLaListaDeCaracteristicasParaEliminar() {
	}
}