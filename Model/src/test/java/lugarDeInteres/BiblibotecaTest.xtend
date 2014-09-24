package lugarDeInteres

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import villano.Villano
import pais.Pais

class BiblibotecaTest {
	
	Biblioteca unaBiblioteca
	
	@Before
	def void setUp() {
		unaBiblioteca = new Biblioteca()
	}
	
	@Test
	def void testLaBibliotecaNoTieneDatosSobreNingunVillanoYAlPedirleUnaPistaTiraExcepcion() {
		assertEquals(unaBiblioteca.pista.get(0), "Lo siento, crea que se ha equivocado de ciudad, no hay nadie con esas características.")			
	}
	
	@Test
	def void testLaBibliotecaEsParteDeLaRutaDeEscapeDelVillanoYDevuelveLasPistasDeSuRutaDeEscape() {
		val alberto = new Villano("Alberto", "Masculino",
			newHashSet => [add("Seña") add("Otra seña")],
			newHashSet => [add("Jugador")]
		)
		val argentina = new Pais("Argentina", 
			newHashSet => [add("Toman mate")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		unaBiblioteca.marcarComoRutaDeEscapeDeVillano(alberto, argentina)
		val pistas = unaBiblioteca.pista
		assertTrue(pistas.size >= 2) //Tiene un 50% de chances de dar un hobbie
		assertTrue(argentina.caracteristicas.contains(pistas.get(0)))
		assertTrue(alberto.seniasParticulares.contains(pistas.get(1)))
		print(pistas)
	}
	
	@Test
	def void testToStringDeLaBibliotecaEsBiblioteca() {
		assertEquals(unaBiblioteca.toString, "Biblioteca")
	}
}