import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.model.ObservableUtils

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
		ObservableUtils.firePropertyChanged(this,"puedeAgregarLugar",puedeAgregarLugar)
	}
	
	def agregarLugarDeInteres() {
		pais.agregarLugarDeInteres(lugarNuevo)
		ObservableUtils.firePropertyChanged(this,"puedeAgregarLugar",puedeAgregarLugar)
	}
	
	def getLugaresPosibles() {
		#[new Club, new Biblioteca, new Banco, new Embajada]
	}
	
	def isPuedeAgregarLugar() {
		pais.lugaresDeInteres.size < 3// && noEstanRepetidos
	}
	
	def noEstanRepetidos() {
		for(LugarDeInteres lugar : pais.lugaresDeInteres){
			if(lugarSeleccionado.toString.equals(lugar.toString))
				return false
		}
		return true
	}
	
}