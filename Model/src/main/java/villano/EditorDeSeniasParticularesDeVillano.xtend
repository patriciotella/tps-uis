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
		ObservableUtils.firePropertyChanged(this,"puedeAgregarSenia",puedeAgregarSenia)
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
	
	def isPuedeAgregarSenia(){
		_seniaNueva != null && _seniaNueva != ""
	}

}