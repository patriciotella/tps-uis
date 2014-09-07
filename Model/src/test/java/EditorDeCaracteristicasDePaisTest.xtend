import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import org.mockito.Mockito

class EditorDeCaracteristicasDePaisTest {
	
	var Pais pais
	var EditorDeCaracteristicasDePais editor
	
	@Before
	def void setUp() {
		pais = Mockito.mock(Pais)
		editor = new EditorDeCaracteristicasDePais(pais)
	}
	
	@Test
	def void testConstructor() {
		assertEquals(editor.pais, pais) 
	}
	
	@Test
	def void testSetCaracteristicaNueva() {
		editor.caracteristicaNueva = "Caracteristica"
		assertEquals(editor.caracteristicaNueva, "Caracteristica")
	}
	
	@Test
	def void testSetCaracteristicaSeleccionada() {
		editor.caracteristicaSeleccionada = "Caracteristica seleccionada"
		assertEquals(editor.caracteristicaSeleccionada, "Caracteristica seleccionada")
	}
	
	@Test
	def void testAgregarCaracteristica() {
		editor.caracteristicaNueva = "Caracteristica"
		editor.agregarCaracteristica
		Mockito.verify(pais, Mockito.times(1)).agregarCaracteristica("Caracteristica")
	}
	
	@Test
	def void testBorrarCaracteristica() {
		editor.caracteristicaSeleccionada = "Caracteristica a borrar"
		editor.borrarCaracteristica
		Mockito.verify(pais, Mockito.times(1)).borrarCaracteristica("Caracteristica a borrar")
	}
}