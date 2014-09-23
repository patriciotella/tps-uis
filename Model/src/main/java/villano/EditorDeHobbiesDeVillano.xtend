package villano

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeHobbiesDeVillano {
	
	@Property EditorDeVillano editorDeVillano
	@Property String hobbieNuevo
	@Property String hobbieSeleccionado
	
	new(EditorDeVillano editorDeVillano) {
		this._editorDeVillano = editorDeVillano
	}
	
	def agregarHobbie() {
		_editorDeVillano.agregarHobbie(hobbieNuevo)
		_hobbieNuevo = ""
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def borrarHobbie() {
		_editorDeVillano.eliminarHobbie(hobbieSeleccionado)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def getHobbies() {
		_editorDeVillano.hobbies
	}
	
}