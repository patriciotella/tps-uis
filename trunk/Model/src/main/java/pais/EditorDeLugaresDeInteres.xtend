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
	EditorDePais pais
	
	@Property
	LugarDeInteres lugarNuevo
	
	@Property
	LugarDeInteres lugarSeleccionado
	
	Set<? extends LugarDeInteres> LUGARESPOSIBLES = 
		#{new Club, new Biblioteca, new Banco, new Embajada}
		
	new(EditorDePais editorDePais){
		this._pais = editorDePais
	}
	
	def borrarLugarDeInteres() {
		_pais.borrarLugarDeInteres(lugarSeleccionado)
		cambioPuedeAgregarLugar()
		ObservableUtils.firePropertyChanged(this,"lugaresDeInteres", lugaresDeInteres)
		ObservableUtils.firePropertyChanged(this,"lugaresPosibles", lugaresPosibles)
	}
	
	def agregarLugarDeInteres() {
		_pais.agregarLugarDeInteres(lugarNuevo)
		cambioPuedeAgregarLugar()	
		ObservableUtils.firePropertyChanged(this,"lugaresDeInteres", lugaresDeInteres)
		ObservableUtils.firePropertyChanged(this,"lugaresPosibles", lugaresPosibles)
	}
	
	def getLugaresPosibles() {
		LUGARESPOSIBLES.filter([!_pais.lugaresDeInteres.contains(it)]).toList
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
		_pais.lugaresDeInteres
	}
}