package carmenSanDiegoUIs import java.util.List
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class EditorDeLugaresDeInteres {
	
	@Property Pais pais
	@Property LugarDeInteres lugarNuevo
	@Property LugarDeInteres lugarSeleccionado
	@Property List<LugarDeInteres> lugaresPosibles
	
	new(Pais pais){
		this._pais = pais
	}
	
	def borrarLugarDeInteres() {
		pais.borrarLugarDeInteres(lugarSeleccionado)
		cambioPuedeAgregarLugar()
	}
	
	def agregarLugarDeInteres() {
		pais.agregarLugarDeInteres(lugarNuevo)
		cambioPuedeAgregarLugar()	
	}
	
	def getLugaresPosibles() {
		#[new Club, new Biblioteca, new Banco, new Embajada]
	}
	
	def isPuedeAgregarLugar() {
		pais.lugaresDeInteres.size < 3 && noEstanRepetidos
	}
	
	def noEstanRepetidos() {
		for(LugarDeInteres lugar : _pais.lugaresDeInteres){
			if(lugar.class.equals(_lugarNuevo.class))
				return false
		}
		return true
	}
	
	def setLugarNuevo(LugarDeInteres lugar) {
		this._lugarNuevo = lugar
		cambioPuedeAgregarLugar()	
	}
	
	private def cambioPuedeAgregarLugar() {
		ObservableUtils.firePropertyChanged(this,"puedeAgregarLugar",puedeAgregarLugar)
	}
	
}