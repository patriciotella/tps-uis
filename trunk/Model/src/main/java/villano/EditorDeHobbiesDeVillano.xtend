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
		ObservableUtils.firePropertyChanged(this, "hayHobbieParaAgregar", hayHobbieParaAgregar)
	}
	
	def borrarHobbie() {
		_editorDeVillano.eliminarHobbie(hobbieSeleccionado)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
		ObservableUtils.firePropertyChanged(this, "seleccionoHobbieAEliminar", seleccionoHobbieAEliminar)
	}
	
	def getHobbies() {
		_editorDeVillano.hobbies
	}
	
	def isHayHobbieParaAgregar(){
		_hobbieNuevo != null && _hobbieNuevo != ""
	}
	
	def isSeleccionoHobbieAEliminar(){
		_hobbieSeleccionado != null && _hobbieSeleccionado != ""
	}
	
	def setHobbieNuevo(String unHobbie) {
		_hobbieNuevo = unHobbie
		ObservableUtils.firePropertyChanged(this, "hayHobbieParaAgregar", hayHobbieParaAgregar)
	}
	
	def setHobbieSeleccionado(String unHobbie) {
		_hobbieSeleccionado = unHobbie
		ObservableUtils.firePropertyChanged(this, "seleccionoHobbieAEliminar", seleccionoHobbieAEliminar)
	}
}