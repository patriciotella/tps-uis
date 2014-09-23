package villano

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class EditorDeSeniasParticularesDeVillano {
	
	@Property EditorDeVillano editorDeVillano
	@Property String seniaNueva
	@Property String seniaSeleccionada
	
	new(EditorDeVillano editorDeVillano) {
		_editorDeVillano = editorDeVillano
	}
	
	def agregarSeniaParticular() {
		_editorDeVillano.agregarSeniaParticular(seniaNueva)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
		_seniaNueva = ""	
	}
	
	def borrarSeniaParticular() {
		_editorDeVillano.eliminarSeniaPArticular(seniaSeleccionada)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}
	
	def getSeniasParticulares() {
		_editorDeVillano.seniasParticulares
	}

}