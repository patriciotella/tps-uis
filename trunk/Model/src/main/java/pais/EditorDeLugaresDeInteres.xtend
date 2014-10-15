package pais

import java.util.Set
import lugarDeInteres.Banco
import lugarDeInteres.Biblioteca
import lugarDeInteres.Club
import lugarDeInteres.Embajada
import lugarDeInteres.LugarDeInteres

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
	}
	
	def agregarLugarDeInteres() {
		_editorDePais.agregarLugarDeInteres(lugarNuevo)
		cambioPuedeAgregarLugar()	
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

	}
	
	def setLugarSeleccionado(LugarDeInteres lugarASeleccionar) {
		_lugarSeleccionado = lugarASeleccionar
	}
	
	def isSeleccionoLugarABorrar() {
		_lugarSeleccionado != null
	}
	
	def getLugaresDeInteres() {
		_editorDePais.lugaresDeInteres
	}
}