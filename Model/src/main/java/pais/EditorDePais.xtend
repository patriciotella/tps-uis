package pais

import java.util.HashSet
import java.util.Set
import lugarDeInteres.LugarDeInteres
import mapamundi.Mapamundi
import java.util.List
import java.util.ArrayList
import lugarDeInteres.Club
import lugarDeInteres.Biblioteca
import lugarDeInteres.Banco
import lugarDeInteres.Embajada

class EditorDePais {
	
	Pais _pais
	
	@Property
	String nombre
	
	@Property
	List<Pais> conexiones
	
	@Property
	Set<String> caracteristicas
	
	@Property
	Set<LugarDeInteres> lugaresDeInteres
	
	Mapamundi _mapamundi
	
	@Property
	String caracteristicaNueva
	
	@Property
	LugarDeInteres lugarDeInteresNuevo
	
	@Property
	Pais conexionNueva
	
	@Property
	String caracteristicaSeleccionada
	
	@Property
	LugarDeInteres lugarSeleccionado
	
	@Property
	Pais conexionSeleccionada
	
	Set<? extends LugarDeInteres> LUGARESPOSIBLES = 
		#{new Club, new Biblioteca, new Banco, new Embajada}
		
	new(Mapamundi mapamundi, Pais pais){
		this._mapamundi = mapamundi
		this._pais = pais
		_nombre = pais.nombre
		_conexiones = new ArrayList(pais.conexiones)
		_caracteristicas = new HashSet(pais.caracteristicas)
		_lugaresDeInteres = new HashSet(pais.lugaresDeInteres)
	}
	
	new(Mapamundi mapamundi) {
		_mapamundi = mapamundi
		_nombre = ""
		_conexiones = newArrayList
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
		//Borrar la conexion unaConexion.borrarConexion(this) pero this debe ser un país
		conexiones.remove(unaConexion)
	}
	
	def agregarConexion(Pais unaConexion) {
		conexiones.add(unaConexion)
	}
	
	def getLugaresPosibles() {
		var resultado = LUGARESPOSIBLES
		for(LugarDeInteres lugar : lugaresDeInteres) {
			resultado = resultado.filter[!it.class.equals(lugar.class)].toSet
		}
		resultado.toList
	}
	
}