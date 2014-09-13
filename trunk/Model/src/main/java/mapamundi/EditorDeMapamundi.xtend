package mapamundi

import org.uqbar.commons.utils.Observable
import pais.Pais
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeMapamundi {
	
	@Property Pais conexionSeleccionada
	@Property Mapamundi mapamundi
	
	new(Mapamundi mapamundi){
		this._mapamundi = mapamundi
	}
	
	def eliminarPais() {
		mapamundi.eliminarPais(conexionSeleccionada)
		ObservableUtils.firePropertyChanged(this, "mapamundi", mapamundi)
	}
	
	def paises(){
		this.mapamundi.paises
	}
	
	def pais(){
		this.conexionSeleccionada
	}
	
	def agregarPais(){
		this.mapamundi.agregarPais(new Pais())
	}
	
	def caracteristicasDePais(){
		this.conexionSeleccionada.caracteristicas
	}
	
	def conexionesPais(){
		this.conexionSeleccionada.conexiones
	}
	//def agregarConexion() {
		//pais.agregarConexion(conexionNueva)
	//}
	
}