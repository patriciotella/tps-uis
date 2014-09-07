import org.uqbar.commons.utils.Observable

@Observable
class EditorDeLugaresDeInteres {
	
	@Property Pais pais
	@Property LugarDeInteres lugarNuevo
	@Property LugarDeInteres lugarSeleccionado
	
	new(Pais pais){
		this._pais = pais
	}
	
	def borrarLugarDeInteres() {
		pais.borrarLugarDeInteres(lugarSeleccionado)
	}
	
	def agregarLugarDeInteres() {
		pais.agregarLugarDeInteres(lugarNuevo)
	}
}