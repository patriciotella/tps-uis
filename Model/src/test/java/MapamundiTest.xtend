

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.mockito.Mockito

class MapamundiTest {
	
	var Mapamundi mapamundi
	var Pais argentina
	
	@Before
	def setUp(){
		mapamundi = new Mapamundi()
		argentina = Mockito.mock(Pais)
		mapamundi.agregarPais(argentina)
	}
	
	@Test
	def agregarPaisesTest(){
		assertTrue(mapamundi.paises.size()==1)
		assertTrue(mapamundi.paises.contains(argentina))
	}
}