package mapamundi

import pais.Pais

class EditorDeMapamundi {
	
	@Property Pais paisSeleccionado
	@Property Mapamundi mapamundi
	
	new(Mapamundi mapamundi){
		this._mapamundi = mapamundi
	}
	
	def eliminarPais() {
		_mapamundi.eliminarPais(_paisSeleccionado)
		actualizarPaises()
	}
	
	def actualizarPaises() {

	}
	
	def agregarPais(Pais unPais){
		_mapamundi.agregarPais(unPais)
		actualizarPaises()
	}

	def isSeleccionoPais() {
		_paisSeleccionado != null
	}
	
	def setPaisSeleccionado(Pais unPais) {
		_paisSeleccionado = unPais
	}
}