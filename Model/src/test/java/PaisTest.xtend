

import java.util.LinkedList
import org.junit.Test

import static org.junit.Assert.*
import java.util.HashMap
import main.java.lugaresDeInteres

class PaisTest {
	
	@Test
	def test() {
		var caracteristicas = new HashMap<String, String>()
		var lugaresDeInteres = new LinkedList<LugarDeInteres>()
		var conexiones = new LinkedList<Pais>()
		
		caracteristicas.put("Bandera", "Celeste y blanca")
		caracteristicas.put("Moneda", "Peso")
		caracteristicas.put("Casa de gobierno", "Rosada")
		caracteristicas.put("Comida tipica", "Empanadas")
		
//		var pais = new Pais("Argentina", caracteristicas, lugaresDeInteres, conexiones)
	}
}