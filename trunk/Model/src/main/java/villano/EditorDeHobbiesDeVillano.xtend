package villano

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
	}
	
	def borrarHobbie() {
		_editorDeVillano.eliminarHobbie(hobbieSeleccionado)
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
	}
	
	def setHobbieSeleccionado(String unHobbie) {
		_hobbieSeleccionado = unHobbie
	}
}