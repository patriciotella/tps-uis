package pais 
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import lugarDeInteres.LugarDeInteres
import java.util.Set
import villano.Villano
import org.uqbar.commons.model.UserException

@Observable
class Pais {
	@Property String nombre
	@Property Set<String> caracteristicas
	@Property Set<LugarDeInteres> lugaresDeInteres
	@Property Set<Pais> conexiones
	
	def agregarCaracteristica(String caracteristica) {
		this._caracteristicas.add(caracteristica)
		cambiaronCaracteristicas
	}
	
	private def cambiaronCaracteristicas() {
		ObservableUtils.firePropertyChanged(this,"caracteristicas",caracteristicas)
	}
	
	new(String unNombre, Set<String> caracteristicas,
		Set<Pais> conexiones, Set<LugarDeInteres> lugaresDeInteres) {
		if(unNombre.empty || caracteristicas.empty || lugaresDeInteres.size < 3) {
			throw new UserException("El país debe tener nombre, al menos una característica y exactamente 3 lugares de interés.")
		}
		_nombre = unNombre
		_caracteristicas = caracteristicas
		_conexiones = conexiones
		_lugaresDeInteres = lugaresDeInteres
	}
	
	def borrarCaracteristica(String caracteristica) {
		_caracteristicas.remove(caracteristica)
		cambiaronCaracteristicas
	}
	
	def borrarConexion(Pais conexion) {
		conexion.borrarConexionDeLista(this)
		borrarConexionDeLista(conexion)
	}
	
	private def borrarConexionDeLista(Pais conexion) {
		_conexiones.remove(conexion)
		cambiaronConexiones		
	}
	
	private def agregarConexionALista(Pais conexion) {
		_conexiones.add(conexion)
		cambiaronConexiones
	}
	
	def agregarConexion(Pais conexion) {
		conexion.agregarConexionALista(this)
		agregarConexionALista(conexion)
	}
	
	private def cambiaronConexiones() {
		ObservableUtils.firePropertyChanged(this,"conexiones",conexiones)
	}
	
	override toString() {
		nombre
	}
	
	def agregarLugarDeInteres(LugarDeInteres lugarDeInteres) {
		this._lugaresDeInteres.add(lugarDeInteres)
		cambiaronLugaresDeInteres()
	}
	
	private def cambiaronLugaresDeInteres() {
		ObservableUtils.firePropertyChanged(this,"lugaresDeInteres",lugaresDeInteres)
	}
	
	def borrarLugarDeInteres(LugarDeInteres lugarDeInteres) {
		this._lugaresDeInteres.remove(lugarDeInteres)
		cambiaronLugaresDeInteres()
	}
	
	def setNombre(String nombre) {
		this._nombre = nombre
	}
	
	def void marcarComoRutaDeEscapeDeVillano(Villano unVillano, Pais proximoPaisEnRuta) {
		_lugaresDeInteres.forEach[marcarComoRutaDeEscapeDeVillano(unVillano, proximoPaisEnRuta)]
		/*Por cada lugar de interés, setearlo como lugar que tiene datos del vilano
		 * y darle el proximo país en la ruta (si no es el último)
		 */
	}
	
	def syncWith(Pais pais) {
		nombre = pais.nombre
		caracteristicas = pais.caracteristicas
		conexiones = pais.conexiones
		lugaresDeInteres = pais.lugaresDeInteres
	}
	
	def void marcarSinVillano() {
		_lugaresDeInteres.forEach[noConoceAlVillano]
	}
	
	def void marcarComoUltimoPaisDeLaRutaDelVillano(Villano unVillano) {
		val lugarDelVillano = _lugaresDeInteres.head 
		val lugaresFiltrados = _lugaresDeInteres.filter[!equals(lugarDelVillano)]
		lugaresFiltrados.forEach[elVillanoEstaEnElPais(unVillano)]
		lugarDelVillano.marcarComoEsconditeDelVillano(unVillano)
	}
	
}