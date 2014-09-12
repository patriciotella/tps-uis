package villano

import org.uqbar.commons.utils.Observable

@Observable
class EditorDeHobbiesDeVillano {
	
	@Property Villano villano
	@Property String hobbieNuevo
	@Property String hobbieSeleccionado
	
	new(Villano villano) {
		this._villano = villano		
	}
	
	def agregarHobbie() {
		this.villano.agregarHobbie(hobbieNuevo)
	}
	
	def borrarHobbie() {
		this.villano.eliminarHobbie(hobbieSeleccionado)
	}
	
	
	
}