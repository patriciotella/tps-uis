package villano

import org.mockito.Mockito
import org.junit.Test
import org.junit.Before


class EditorDeHobbiesDeVillanoTest {
	
	var Villano villano
	var EditorDeHobbiesDeVillano editor
	
	@Before
	def void setUp(){
		villano = Mockito.mock(Villano)
		editor = new EditorDeHobbiesDeVillano(villano)
	}
	
	@Test
	def void agregarYBorrarHobbiesTest() {
		editor.agregarHobbie()
		editor.borrarHobbie()
		Mockito.verify(villano,Mockito.times(2))
	}
	
}