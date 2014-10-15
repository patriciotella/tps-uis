package pais

import org.uqbar.commons.utils.Observable
import mapamundi.Mapamundi
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeConexionesDePais {

	@Property EditorDePais editorDePais
	@Property Pais conexionNueva
	@Property Pais conexionSeleccionada
	@Property Mapamundi mapamundi

	new(EditorDePais editorDePais, Mapamundi mapamundi) {
		this._editorDePais = editorDePais
		this._mapamundi = mapamundi
	}

	def borrarConexion() {
		modificarConexion([_editorDePais.borrarConexion(conexionSeleccionada)])
	}

	def agregarConexion() {
		modificarConexion([_editorDePais.agregarConexion(conexionNueva)])
	}

	def getConexiones() {
		_editorDePais.conexiones
	}
	
	def getConexionesParaAgregar() {
		_mapamundi.paises.filter[it != _editorDePais.pais && !_editorDePais.conexiones.contains(it)].toSet
	}
	
	//(Tipo del parámetro)=>Tipo del bloque nombreDelBloque
	/*
	 * Los métodos son objetos, así que se pueden pasar como parámetros y 
	 * ejecutarse cuando se le pida.
	 */
	def private modificarConexion((Void)=>void func){
		func.apply(null)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
		ObservableUtils.firePropertyChanged(this, "conexionesParaAgregar", conexionesParaAgregar)
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
