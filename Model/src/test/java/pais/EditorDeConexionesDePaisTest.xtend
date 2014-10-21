package pais

import mapamundi.Mapamundi
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import lugarDeInteres.Biblioteca

class EditorDeConexionesDePaisTest {
	
	EditorDePais editorDePais
	EditorDeConexionesDePais editorDeConexiones
	Pais argentina
	Pais chile
	Mapamundi mapamundi
	
//	@Before
//	def void setUp() {
//		argentina = new Pais("Argentina", 
//			newHashSet => [add("Toman mate")],
//			newHashSet, newHashSet => [
//				add(new Club) add(new Banco) add(new Embajada)
//			]
//		)
//		chile = new Pais("Chile", 
//			newHashSet => [add("Característica")],
//			newHashSet, newHashSet => [
//				add(new Club) add(new Biblioteca) add(new Embajada)
//			]
//		)
//		mapamundi = new Mapamundi => [
//			agregarPais(argentina)
//			agregarPais(chile)
//		]
//		editorDePais = new EditorDePais(mapamundi, argentina)
//		editorDeConexiones = new EditorDeConexionesDePais(editorDePais, mapamundi)
//	}
//	
//	@Test
//	def testLasConexionesParaAgregarSonLaDiferenciaEntreLasConexionesDelPaisYLosPaisesDelMapamundiMenosElPais() {
//		assertTrue(editorDeConexiones.conexionesParaAgregar.contains(chile))
//		assertFalse(editorDeConexiones.conexionesParaAgregar.contains(argentina))
//	}
	
//	@Test
//	def testSiNoTienePaisesParaAgregar
}