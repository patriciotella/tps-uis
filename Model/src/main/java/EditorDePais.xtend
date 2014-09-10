

import org.uqbar.commons.utils.Observable

@Observable
class EditorDePais {
	
	Pais _pais
	
	Mapamundi _mapamundi
	
	new(Mapamundi mapamundi, Pais pais){
		this._mapamundi = mapamundi
		this._pais = pais
	}
	
	def agregarPais(){
		this._mapamundi.agregarPais(this._pais)
	}
	
	def getPais(){
		this._pais
	}
	
	def getMapamundi(){
		this._mapamundi
	}
}