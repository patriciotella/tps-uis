package villano

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class VillanoTest {
	
	var Villano carlin

	@Before
	def setUp(){
		
		carlin = new Villano()
		carlin.setNombre("Carlin")
		carlin.setSexo("Masculino")
		carlin.agregarHobbie("hacker")
		carlin.agregarSeniaParticular("laDelAnchoDeBasto")
		
	}
	@Test
	def villanoContructoresTest() {
		
		assertEquals(carlin.nombre, "Carlin")
		assertEquals(carlin.sexo, "Masculino")
		assertTrue(carlin.seniasParticulares.contains("laDelAnchoDeBasto"))
		assertTrue(carlin.hobbies.contains("hacker"))
	}
	
	@Test
	def AgregarCaracteristicasYHobbiesTest(){
		carlin.agregarHobbie("otroHobbie")
		carlin.agregarSeniaParticular("otraSeña")
		assertTrue(carlin.hobbies.size()==2)
		assertTrue(carlin.seniasParticulares.size==2)
	}
}