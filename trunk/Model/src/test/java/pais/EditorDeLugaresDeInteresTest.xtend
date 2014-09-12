package pais

import org.junit.Before
import org.mockito.Mockito
import org.junit.Test

import static org.junit.Assert.*
import lugarDeInteres.LugarDeInteres


class EditorDeLugaresDeInteresTest {
	
	var EditorDeLugaresDeInteres editor
	var Pais pais
	var LugarDeInteres lugarNuevo
	var LugarDeInteres lugarSeleccionado
	
	@Before
	def setUp(){
		
		lugarNuevo = Mockito.mock(LugarDeInteres)
		lugarSeleccionado = Mockito.mock(LugarDeInteres)
		pais = Mockito.mock(Pais)
		editor = new EditorDeLugaresDeInteres(pais)
		editor.lugarNuevo = lugarNuevo
		editor.lugarSeleccionado = lugarSeleccionado
	}
	
	@Test
	def void agregarYBorrarLugaresDeinteresTest(){
		editor.agregarLugarDeInteres()
		editor.borrarLugarDeInteres()
		Mockito.verify(pais, Mockito.times(2))
	}
	
	@Test
	def void getLugaresPosiblesTest(){
		assertTrue(editor.lugaresPosibles.size()==4)
	}
}