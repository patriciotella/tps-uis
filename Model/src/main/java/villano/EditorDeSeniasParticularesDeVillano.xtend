package villano

class EditorDeSeniasParticularesDeVillano {
	
	@Property EditorDeVillano editorDeVillano
	@Property String seniaNueva
	@Property String seniaSeleccionada
	
	new(EditorDeVillano editorDeVillano) {
		this._editorDeVillano = editorDeVillano
	}
	
	def agregarSeniaParticular() {
		_editorDeVillano.agregarSeniaParticular(seniaNueva)
		cambioPuedeAgregarSenia()
		_seniaNueva = ""	
	}
	
	private def cambioPuedeAgregarSenia() {
	}
	
	
	def borrarSeniaParticular() {
		_editorDeVillano.eliminarSeniaParticular(seniaSeleccionada)
		cambioPuedeAgregarSenia()
	}
	
	def getSeniasParticulares() {
		_editorDeVillano.seniasParticulares
	}
	
	def isSeleccionoSeniaABorrar() {
		_seniaSeleccionada != null
	}
	
	def isHaySeniaParaAgregar(){
		_seniaNueva != null && _seniaNueva != ""
	}

	def setSeniaNueva(String unaSenia) {
		_seniaNueva = unaSenia
		cambioPuedeAgregarSenia
	}
	
	def setSeniaSeleccionada(String unaSenia) {
		_seniaSeleccionada = unaSenia
	}
}