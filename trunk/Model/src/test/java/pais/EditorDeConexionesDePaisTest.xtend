package pais

import org.junit.Before
import org.junit.Test
import org.mockito.Mockito
import mapamundi.Mapamundi

class EditorDeConexionesDePaisTest {
	
	var Pais pais
	var Mapamundi mapamundi
	var EditorDeConexionesDePais editor
	
	@Before
	def void setUp(){
		pais = Mockito.mock(Pais)
		mapamundi = Mockito.mock(Mapamundi)
		editor = new EditorDeConexionesDePais(pais,mapamundi)
		
	}
	
	@Test
	def void borrarConexionyAgregarConexionTest() {
		editor.borrarConexion()
		editor.agregarConexion()
		Mockito.verify(pais,Mockito.times(2))
	}
	
}