package pais

import org.uqbar.commons.utils.Observable
import mapamundi.Mapamundi
import java.util.Set
import lugarDeInteres.LugarDeInteres
import java.util.HashSet

@Observable
class EditorDePais {
	
	Pais _pais
	
	@Property
	String nombre
	
	@Property
	Set<Pais> conexiones
	
	@Property
	Set<String> caracteristicas
	
	@Property
	Set<LugarDeInteres> lugaresDeInteres
	
	Mapamundi _mapamundi
	
	new(Mapamundi mapamundi, Pais pais){
		this._mapamundi = mapamundi
		this._pais = pais
		_nombre = pais.nombre
		_conexiones = new HashSet(pais.conexiones)
		_caracteristicas = new HashSet(pais.caracteristicas)
		_lugaresDeInteres = new HashSet(pais.lugaresDeInteres)
	}
	
	new(Mapamundi mapamundi) {
		_mapamundi = mapamundi
		_nombre = ""
		_conexiones = newHashSet
		_caracteristicas = newHashSet
		_lugaresDeInteres = newHashSet	
	}
	
	def agregarPais(){
		val paisParaAgregar = new Pais(_nombre, _caracteristicas, _conexiones, _lugaresDeInteres)
		if(_pais == null){
			_pais = paisParaAgregar
			this._mapamundi.agregarPais(this._pais)
		}else{
			_pais.syncWith(paisParaAgregar)
		}
	}
	
	def getPais(){
		this._pais
	}
	
	def getMapamundi(){
		this._mapamundi
	}
	
	def agregarCaracteristica(String caracteristica) {
		caracteristicas.add(caracteristica)
	}
	
	def borrarCaracteristica(String caracteristica) {
		caracteristicas.remove(caracteristica)
	}
	
	def borrarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		lugaresDeInteres.remove(unLugarDeInteres)
	}
	
	def agregarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		lugaresDeInteres.add(unLugarDeInteres)
	}
	
	def borrarConexion(Pais unaConexion) {
		conexiones.remove(unaConexion)
		unaConexion.borrarConexion(_pais)
	}
	
	def agregarConexion(Pais unaConexion) {
		conexiones.add(unaConexion)
		unaConexion.agregarConexion(_pais)
	}
	
}