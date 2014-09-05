

import java.util.LinkedList
import org.junit.Test

import static org.junit.Assert.*

class VillanoTest {
	
	var Villano carlin

	@Test
	def villanoTest() {
		var hobbiesDeCarlin = new LinkedList<String>()
		hobbiesDeCarlin.add("Hacker")
		var senias = new LinkedList<String>()
		carlin = new Villano("Carlin", "Masculino", senias, hobbiesDeCarlin)
		assertEquals(carlin.nombre, "Carlin")
		assertEquals(carlin.sexo, "Masculino")
		assertEquals(carlin.seniasParticulares, senias)
		assertEquals(carlin.hobbies, hobbiesDeCarlin)
	}
}