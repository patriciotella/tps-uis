package carmenSanDiegoUIs

import java.util.LinkedList

import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import java.util.List

class PaisTest {
	
	var List<String> caracteristicas
	var Pais pais
	
	@Before
	def setUp() {
		caracteristicas = new LinkedList<String>()
		
		caracteristicas.add("Bandera celeste y blanca")
		caracteristicas.add("Moneda peso")
		caracteristicas.add("Casa de gobierno Rosada")
		caracteristicas.add("Comida tipica empanadas")
		
		pais = new Pais()
		pais.nombre = "Argentina"
		pais.caracteristicas = caracteristicas
	}
	
	@Test
	def testConstructor() {	
		assertEquals(pais.caracteristicas, caracteristicas)
		assertEquals(pais.nombre, "Argentina")
		assertEquals(pais.conexiones, newArrayList)
		assertEquals(pais.lugaresDeInteres, newArrayList)
	}
	
	@Test
	def testAgregarCaracteristica() {
		pais.agregarCaracteristica("Caracteristica agregada")
		assertTrue(pais.caracteristicas.contains("Caracteristica agregada"))
	}
	
	@Test
	def testBorrarCaracteristica() {
		pais.borrarCaracteristica("Casa de gobierno Rosada")
		assertFalse(pais.caracteristicas.contains("Casa de gobierno Rosada"))
	}
	
	@Test
	def testAgregarConexion() {
		val conexion = new Pais()
		pais.agregarConexion(conexion)
		assertTrue(pais.conexiones.contains(conexion))
	}
	
	@Test
	def testBorrarConexion() {
		val conexion = new Pais()
		pais.agregarConexion(conexion)
		assertTrue(pais.conexiones.contains(conexion))
		
		pais.borrarConexion(conexion)
		assertFalse(pais.conexiones.contains(conexion))
	}
	
	@Test
	def testToString() {
		assertEquals(pais.toString, "Argentina")
	}
	
	@Test
	def testAgregarLugarDeInteres() {
		val club = new Club
		pais.agregarLugarDeInteres(club)
		assertTrue(pais.lugaresDeInteres.contains(club))
	}
	
	@Test
	def testBorrarLugarDeInteres() {
		val banco = new Banco
		pais.agregarLugarDeInteres(banco)
		assertTrue(pais.lugaresDeInteres.contains(banco))
		pais.borrarLugarDeInteres(banco)
		assertFalse(pais.lugaresDeInteres.contains(banco))
	}
	
	@Test
	def testPuedeCrearPais() {
		assertTrue(pais.puedeCrearPais)
	}
	
	@Test
	def testNoPuedeCrearPais() {
		assertFalse(new Pais().puedeCrearPais)
	}
	
}