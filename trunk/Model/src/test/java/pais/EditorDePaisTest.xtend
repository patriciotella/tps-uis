package pais

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import mapamundi.Mapamundi
import lugarDeInteres.Club
import lugarDeInteres.Biblioteca
import lugarDeInteres.Embajada
import lugarDeInteres.Banco

class EditorDePaisTest {

	Mapamundi mapamundi
	EditorDePais editor
	
	@Before
	def void setUp() {
		mapamundi = new Mapamundi
		editor = new EditorDePais(mapamundi)
	}
	
	@Test
	def alCrearElEditorSinPaisSusPropiedadesSonInicializadasVacias() {
		assertTrue(editor.nombre.empty)
		assertTrue(editor.caracteristicas.empty)
		assertTrue(editor.conexiones.empty)
		assertTrue(editor.lugaresDeInteres.empty)
	}
	
	@Test
	def seAgregaElPaisAlMapamundiCuandoTieneTodosLosDatos() {
		editor.nombre = "Argentina"
		editor.agregarCaracteristica("Toman mate")
		editor.agregarLugarDeInteres(new Club)
		editor.agregarLugarDeInteres(new Embajada)
		editor.agregarLugarDeInteres(new Biblioteca)
		editor.agregarPais
		
		assertFalse(mapamundi.paises.empty)
		assertEquals(mapamundi.paises.get(0).nombre, "Argentina")
	}
	
//	@Test
//	def alCrearElEditorConUnPaisLasPropiedadesReflejanLasDelPais() {
//		val lugaresDeInteres = newHashSet => [
//			add(new Club) add(new Banco) add(new Embajada)
//		]
//		editor = new EditorDePais(mapamundi,
//			new Pais("Chile", #{"Vecinos"}, #{}, lugaresDeInteres))
//		assertEquals(editor.nombre, "Chile")
//		assertTrue(editor.caracteristicas.contains("Vecinos"))
//		assertTrue(editor.conexiones.empty)
//		assertEquals(editor.lugaresDeInteres, lugaresDeInteres)
//	}
//	
//	@Test
//	def siAgregoUnPaisQueYaExisteLoModificaSegunLosDatosDelEditor() {
//		val chile = new Pais("Chile", #{"Vecinos"}, #{},
//			newHashSet => [add(new Club) add(new Banco) add(new Embajada)])
//		mapamundi.agregarPais(chile)
//		editor = new EditorDePais(mapamundi, chile)
//		editor.nombre = "Chi"
//		editor.agregarPais
//		
//		assertEquals(mapamundi.paises.get(0).nombre, "Chi")
//	}
}