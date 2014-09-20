package pais

import org.uqbar.commons.utils.Observable
import mapamundi.Mapamundi
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeConexionesDePais {

	@Property Pais pais
	@Property Pais conexionNueva
	@Property Pais conexionSeleccionada
	@Property Mapamundi mapamundi

	new(Pais pais, Mapamundi mapamundi) {
		this._pais = pais
		this._mapamundi = mapamundi
	}

	def borrarConexion() {
		//Le pasa el mensaje a ejecutar en un bloque.
		modificarConexion([pais.borrarConexion(conexionSeleccionada)])
		conexionSeleccionada.borrarConexion(pais)
	}

	def agregarConexion() {
		modificarConexion([pais.agregarConexion(conexionNueva)])
		conexionNueva.agregarConexion(pais)
	}

	def getConexiones() {
		_mapamundi.paises.filter[it != _pais && !_pais.conexiones.contains(it)].toList
	}
	
	def isTieneConexiones() {
		getConexiones.size != 0
	}
	
	//(Tipo del parámetro)=>Tipo del bloque nombreDelBloque
	/*
	 * Los métodos son objetos, así que se pueden pasar como parámetros y 
	 * ejecutarse cuando se le pida.
	 */
	def modificarConexion((Void)=>void func){
		func.apply(null)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
		ObservableUtils.firePropertyChanged(this, "tieneConexiones", tieneConexiones)
	}
}
