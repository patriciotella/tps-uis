package villano

import org.uqbar.commons.utils.Observable

@Observable
class EditorDeSeniasParticularesDeVillano {
	
	@Property Villano villano
	@Property String seniaNueva
	@Property String seniaSeleccionada
	
	new(Villano villano) {
		this._villano = villano
	}
	
	def agregarSeniaParticular() {
		this.villano.agregarSeniaParticular(seniaNueva)
	}
	
	def borrarSeniaParticular() {
		this.villano.eliminarSeniaPArticular(seniaSeleccionada)
	}
}