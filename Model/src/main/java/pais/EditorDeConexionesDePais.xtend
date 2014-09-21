package pais

import org.uqbar.commons.utils.Observable
import mapamundi.Mapamundi
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeConexionesDePais {

	@Property EditorDePais pais
	@Property Pais conexionNueva
	@Property Pais conexionSeleccionada
	@Property Mapamundi mapamundi

	new(EditorDePais editorDePais, Mapamundi mapamundi) {
		this._pais = editorDePais
		this._mapamundi = mapamundi
	}

	def borrarConexion() {
		//Le pasa el mensaje a ejecutar en un bloque.
		modificarConexion([pais.borrarConexion(conexionSeleccionada)])
	}

	def agregarConexion() {
		modificarConexion([pais.agregarConexion(conexionNueva)])
	}

	def getConexiones() {
		_pais.conexiones
	}
	
	def getConexionesParaAgregar() {
		_mapamundi.paises.filter[it != _pais && !_pais.conexiones.contains(it)].toSet
	}
	
	def isTieneConexiones() {
		getConexionesParaAgregar.size != 0
	}
	
	//(Tipo del parámetro)=>Tipo del bloque nombreDelBloque
	/*
	 * Los métodos son objetos, así que se pueden pasar como parámetros y 
	 * ejecutarse cuando se le pida.
	 */
	def modificarConexion((Void)=>void func){
		func.apply(null)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
		ObservableUtils.firePropertyChanged(this, "conexionesParaAgregar", conexionesParaAgregar)
		ObservableUtils.firePropertyChanged(this, "tieneConexiones", tieneConexiones)
		ObservableUtils.firePropertyChanged(this, "seleccionoConexionParaAgregar", seleccionoConexionParaAgregar)
	}
	
	def isSeleccionoConexionParaAgregar() {
		conexionNueva != null
	}
	
	def setConexionNueva(Pais unPais) {
		_conexionNueva = unPais
		ObservableUtils.firePropertyChanged(this, "seleccionoConexionParaAgregar", seleccionoConexionParaAgregar)
	}
	
	def isSeleccionoConexionAEliminar() {
		_conexionSeleccionada != null
	}
	
	def setConexionSeleccionada(Pais unPais) {
		_conexionSeleccionada = unPais
		ObservableUtils.firePropertyChanged(this, "seleccionoConexionAEliminar", seleccionoConexionAEliminar)
	}
}
