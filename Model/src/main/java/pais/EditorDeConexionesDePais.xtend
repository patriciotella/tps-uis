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
	
	new(Pais pais, Mapamundi mapamundi){
		this._pais = pais
		this._mapamundi = mapamundi
	}
	
	def borrarConexion() {
		pais.borrarConexion(conexionSeleccionada)
		ObservableUtils.firePropertyChanged(this,"conexiones", conexiones)
	}
	
	def agregarConexion() {
		pais.agregarConexion(conexionNueva)
		ObservableUtils.firePropertyChanged(this,"conexiones", conexiones)
	}
	
	def getConexiones() {
		var conexiones = newArrayList
		for(Pais pais : _mapamundi.paises){
			if(!pais.equals(_pais) && !_pais.conexiones.contains(pais))
				conexiones.add(pais)
		}
		return conexiones
	}
	
}