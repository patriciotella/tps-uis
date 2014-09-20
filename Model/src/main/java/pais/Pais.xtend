package pais 
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import lugarDeInteres.LugarDeInteres
import java.util.Set
import villano.Villano

@Observable
class Pais {
	@Property String nombre
	@Property List<String> caracteristicas
	@Property List<LugarDeInteres> lugaresDeInteres
	@Property Set<Pais> conexiones
	
	def agregarCaracteristica(String caracteristica) {
		this._caracteristicas.add(caracteristica)
		cambiaronCaracteristicas
	}
	
	private def cambiaronCaracteristicas() {
		ObservableUtils.firePropertyChanged(this,"caracteristicas",caracteristicas)
	}

	new() {
		caracteristicas = newArrayList
		lugaresDeInteres = newArrayList
		conexiones = newHashSet
		nombre = ""
	}
	
	def borrarCaracteristica(String caracteristica) {
		this._caracteristicas.remove(caracteristica)
		cambiaronCaracteristicas
	}
	
	def borrarConexion(Pais conexion) {
		this._conexiones.remove(conexion)
		cambiaronConexiones
	}
	
	private def cambiaronConexiones() {
		ObservableUtils.firePropertyChanged(this,"conexiones",conexiones)
	}
	
	def agregarConexion(Pais conexion) {
		this._conexiones.add(conexion)
		cambiaronConexiones
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
	
	def isPuedeCrearPais() {
		!this._nombre.equals("")
	}
	
	def setNombre(String nombre) {
		this._nombre = nombre
		ObservableUtils.firePropertyChanged(this,"puedeCrearPais",puedeCrearPais)
	}
	
	def marcarComoRutaDeEscapeDeVillano(Villano unVillano, Pais proximoPaisEnRuta) {
		/*Por cada lugar de interés, setearlo como lugar que tiene datos del vilano
		 * y darle el proximo país en la ruta (si no es el último)
		 */
	}
	
}