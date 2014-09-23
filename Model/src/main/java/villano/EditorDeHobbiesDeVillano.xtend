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
		ObservableUtils.firePropertyChanged(this, "puedeEliminarHobbie", puedeEliminarHobbie)
	}
	
	def getHobbies() {
		_editorDeVillano.hobbies
	}
	
	def isHayHobbieParaAgregar(){
		_hobbieNuevo != null && _hobbieNuevo != ""
	}
	
	def isPuedeEliminarHobbie(){
		_hobbieSeleccionado != null && getHobbies().size > 0
	}
	
	def setHobbieNuevo(String unHobbie) {
		_hobbieNuevo = unHobbie
		ObservableUtils.firePropertyChanged(this, "hayHobbieParaAgregar", hayHobbieParaAgregar)
	}
	
	def setHobbieSeleccionado(String unHobbie) {
		_hobbieSeleccionado = unHobbie
		ObservableUtils.firePropertyChanged(this, "puedeEliminarHobbie", puedeEliminarHobbie)
	}
}