package mapamundi

import org.uqbar.commons.utils.Observable
import pais.Pais
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeMapamundi {
	
	@Property Pais paisSeleccionado
	@Property Mapamundi mapamundi
	
	new(Mapamundi mapamundi){
		this._mapamundi = mapamundi
	}
	
	def eliminarPais() {
		_mapamundi.eliminarPais(_paisSeleccionado)
		ObservableUtils.firePropertyChanged(this, "mapamundi", _mapamundi)
		ObservableUtils.firePropertyChanged(this, "seleccionoPais", seleccionoPais)
	}
	
	def agregarPais(Pais unPais){
		_mapamundi.agregarPais(unPais)
		ObservableUtils.firePropertyChanged(this, "mapamundi", _mapamundi)
	}

	def isSeleccionoPais() {
		_paisSeleccionado != null
	}
	
	def setPaisSeleccionado(Pais unPais) {
		_paisSeleccionado = unPais
		ObservableUtils.firePropertyChanged(this, "seleccionoPais", seleccionoPais)
	}
}