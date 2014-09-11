package carmenSanDiegoUIs

import org.uqbar.commons.utils.Observable

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
	}
	
	def agregarConexion() {
		pais.agregarConexion(conexionNueva)
	}
	
}