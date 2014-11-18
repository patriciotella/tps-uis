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
	Set<Pais> conexiones
	
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
	
	Set<Pais> conexionesParaAgregarPais
		
	new(Mapamundi mapamundi, Pais pais){
		this._mapamundi = mapamundi
		this._pais = pais
		_nombre = pais.nombre
		_conexiones = new HashSet(pais.conexiones)
		_caracteristicas = new HashSet(pais.caracteristicas)
		_lugaresDeInteres = new HashSet(pais.lugaresDeInteres)
		conexionesParaAgregarPais = new HashSet
	}
	
	new(Mapamundi mapamundi) {
		_mapamundi = mapamundi
		_nombre = ""
		_conexiones = new HashSet
		_caracteristicas = new HashSet
		_lugaresDeInteres = new HashSet
		conexionesParaAgregarPais = new HashSet
	}
	
	def agregarPais(){
		val paisParaAgregar = new Pais(_nombre, _caracteristicas, _conexiones.toList, _lugaresDeInteres)
		if(_pais == null){
			_pais = paisParaAgregar
			this._mapamundi.agregarPais(this._pais)
		}else{
			_pais.syncWith(paisParaAgregar)
		}
		agregarConexionesAlFinalizar
	}
	
	def getPais(){
		this._pais
	}
	
	def getMapamundi(){
		this._mapamundi
	}
	
	def agregarCaracteristica(String caracteristica) {
		_caracteristicas.add(caracteristica)
		_caracteristicaNueva=""
		
	}
	
	def borrarCaracteristica(String caracteristica) {
		_caracteristicas.remove(caracteristica)
	}
	
	def borrarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		_lugaresDeInteres.remove(unLugarDeInteres)
	}
	
	def agregarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		if(unLugarDeInteres != null)
			_lugaresDeInteres.add(unLugarDeInteres)
	}
	
	def borrarConexion(Pais unaConexion) {
		//Borrar la conexion unaConexion.borrarConexion(this) pero this debe ser un país
		_conexiones.remove(unaConexion)
		if(conexionesParaAgregarPais.contains(unaConexion))
			conexionesParaAgregarPais.remove(unaConexion)
		else
			unaConexion.borrarConexion(_pais)
	}
	
	def agregarConexion(Pais unaConexion) {
		_conexiones.add(unaConexion)
		conexionesParaAgregarPais.add(unaConexion)
		_conexionNueva = null
	}
	
	def getLugaresPosibles() {
		var resultado = LUGARESPOSIBLES
		for(LugarDeInteres lugar : lugaresDeInteres) {
			resultado = resultado.filter[!it.class.equals(lugar.class)].toSet
		}
		resultado.toList
	}
	
	def getCaracteristicas(){
		_caracteristicas.toList
	}
	
	def getLugaresDeInteres(){
		_lugaresDeInteres.toList
	}
	
	def getConexiones() {
		_conexiones.toList
	}
	
	def getConexionesParaAgregar() {
		_mapamundi.paises.filter[it != _pais && !_conexiones.contains(it)].toList
	}
	
	def agregarConexionesAlFinalizar() {
		conexionesParaAgregarPais.forEach([agregarConexion(_pais)])
	}
	
	def void sincWith(Pais unPais, Mapamundi mapamundi) {
		_mapamundi = mapamundi
		this._pais = unPais
		_nombre = unPais.nombre
		_conexiones = new HashSet(unPais.conexiones)
		_caracteristicas = new HashSet(unPais.caracteristicas)
		_lugaresDeInteres = new HashSet(unPais.lugaresDeInteres)
	}
}