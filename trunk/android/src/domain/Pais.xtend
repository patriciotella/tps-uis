package domain

import java.util.Set
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pais {
	String nombre
	Set<String> caracteristicas
	Set<LugarDeInteres> lugaresDeInteres
	List<Pais> conexiones
	
	def agregarCaracteristica(String caracteristica) {
		this.caracteristicas.add(caracteristica)
	}
	
	new(String unNombre, Set<String> caracteristicas,
		List<Pais> conexiones, Set<LugarDeInteres> lugaresDeInteres) {
		validarParametros(unNombre, caracteristicas, lugaresDeInteres)
		nombre = unNombre
		this.caracteristicas = caracteristicas
		this.conexiones = conexiones
		this.lugaresDeInteres = lugaresDeInteres
	}
	
	def validarParametros(String unNombre, Set<String> caracteristicas, Set<LugarDeInteres> lugaresDeInteres) {
		if(unNombre.empty || caracteristicas.empty || lugaresDeInteres.size < 3) {
			throw new RuntimeException("El país debe tener nombre, al menos una característica y exactamente 3 lugares de interés.")
		}
	}
	
	def borrarCaracteristica(String caracteristica) {
		caracteristicas.remove(caracteristica)
	}
	
	def borrarConexion(Pais conexion) {
		conexion.borrarConexionDeLista(this)
		borrarConexionDeLista(conexion)
	}
	
	private def borrarConexionDeLista(Pais conexion) {
		conexiones.remove(conexion)
	}
	
	private def agregarConexionALista(Pais conexion) {
		conexiones.add(conexion)
	}
	
	def agregarConexion(Pais conexion) {
		agregarConexionALista(conexion)
	}
	
	override toString() {
		nombre
	}
	
	def agregarLugarDeInteres(LugarDeInteres lugarDeInteres) {
		this.lugaresDeInteres.add(lugarDeInteres)
	}
	
	def borrarLugarDeInteres(LugarDeInteres lugarDeInteres) {
		this.lugaresDeInteres.remove(lugarDeInteres)
	}
	
	def setNombre(String nombre) {
		this.nombre = nombre
	}
	
	def void marcarComoRutaDeEscapeDeVillano(Villano unVillano, Pais proximoPaisEnRuta) {
		lugaresDeInteres.forEach[marcarComoRutaDeEscapeDeVillano(unVillano, proximoPaisEnRuta)]
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
	
	def getPistaDeLugar(String nombreDelLugar) {
		val lugar = lugaresDeInteres.filter[nombre == nombreDelLugar]
		return lugar.head.pista
	}
	
	def getNombreDePais() {
		nombre
	}
	
}