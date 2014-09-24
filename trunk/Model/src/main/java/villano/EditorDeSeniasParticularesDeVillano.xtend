package villano

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
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
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
		_seniaNueva = ""	
	}
	
	private def cambioPuedeAgregarSenia() {
		ObservableUtils.firePropertyChanged(this,"haySeniaParaAgregar",haySeniaParaAgregar)
	}
	
	
	def borrarSeniaParticular() {
		_editorDeVillano.eliminarSeniaPArticular(seniaSeleccionada)
		cambioPuedeAgregarSenia()
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
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
		ObservableUtils.firePropertyChanged(this, "seleccionoSeniaABorrar", seleccionoSeniaABorrar)
	}
}