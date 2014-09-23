package pais

import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import lugarDeInteres.LugarDeInteres
import lugarDeInteres.Club
import lugarDeInteres.Biblioteca
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import java.util.Set

@Observable
class EditorDeLugaresDeInteres {
	
	@Property 
	EditorDePais editorDePais
	
	@Property
	LugarDeInteres lugarNuevo
	
	@Property
	LugarDeInteres lugarSeleccionado
	
	Set<? extends LugarDeInteres> LUGARESPOSIBLES = 
		#{new Club, new Biblioteca, new Banco, new Embajada}
		
	new(EditorDePais editorDePais){
		this._editorDePais = editorDePais
	}
	
	def borrarLugarDeInteres() {
		_editorDePais.borrarLugarDeInteres(lugarSeleccionado)
		cambioPuedeAgregarLugar()
		ObservableUtils.firePropertyChanged(this,"lugaresDeInteres", lugaresDeInteres)
		ObservableUtils.firePropertyChanged(this,"lugaresPosibles", lugaresPosibles)
	}
	
	def agregarLugarDeInteres() {
		_editorDePais.agregarLugarDeInteres(lugarNuevo)
		cambioPuedeAgregarLugar()	
		ObservableUtils.firePropertyChanged(this,"lugaresDeInteres", lugaresDeInteres)
		ObservableUtils.firePropertyChanged(this,"lugaresPosibles", lugaresPosibles)
	}
	
	def getLugaresPosibles() {
		var resultado = LUGARESPOSIBLES
		for(LugarDeInteres lugar : editorDePais.lugaresDeInteres) {
			resultado = resultado.filter[!it.class.equals(lugar.class)].toSet
		}
		resultado
	}
	
	def isPuedeAgregarLugar() {
		getLugaresPosibles.size > 1 && lugarNuevo != null
	}
	
	def setLugarNuevo(LugarDeInteres lugar) {
		this._lugarNuevo = lugar
		cambioPuedeAgregarLugar()	
	}
	
	private def cambioPuedeAgregarLugar() {
		ObservableUtils.firePropertyChanged(this,"puedeAgregarLugar",puedeAgregarLugar)
	}
	
	def setLugarSeleccionado(LugarDeInteres lugarASeleccionar) {
		_lugarSeleccionado = lugarASeleccionar
		ObservableUtils.firePropertyChanged(this,"seleccionoLugarABorrar", seleccionoLugarABorrar)
	}
	
	def isSeleccionoLugarABorrar() {
		_lugarSeleccionado != null
	}
	
	def getLugaresDeInteres() {
		_editorDePais.lugaresDeInteres
	}
}