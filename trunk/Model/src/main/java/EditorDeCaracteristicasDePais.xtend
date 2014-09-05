

import org.uqbar.commons.utils.Observable

@Observable
class EditorDeCaracteristicasDePais {
	
	@Property Pais pais
	@Property String caracteristicaNueva
	@Property String caracteristicaSeleccionada
	
	new(Pais pais){
		this._pais = pais
	}
	
	def agregarCaracteristica() {
		this.pais.agregarCaracteristica(caracteristicaNueva)
	}
	
	def borrarCaracteristica() {
		this.pais.borrarCaracteristica(caracteristicaSeleccionada)
	}
}