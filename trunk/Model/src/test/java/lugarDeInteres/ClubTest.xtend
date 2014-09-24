package lugarDeInteres

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import villano.Villano
import pais.Pais

class ClubTest {
	
	Club club
	
	@Before
	def void setUp() {
		club = new Club
	}
	
	@Test
	def void testElClubNoTieneDatosSobreNingunVillanoYAlPedirleUnaPistaTiraExcepcion() {
		assertEquals(club.pista.get(0), "Lo siento, crea que se ha equivocado de ciudad, no hay nadie con esas características.")			
	}
	
	@Test
	def void testElClubEsParteDeLaRutaDeEscapeDelVillanoYDevuelveLasPistasDeSuRutaDeEscape() {
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
		club.marcarComoRutaDeEscapeDeVillano(alberto, argentina)
		val pistas = club.pista
		assertTrue(pistas.size >= 2) //Puede devolder dos señas particulares y 70% de las veces un hobbie
		assertTrue(alberto.seniasParticulares.contains(pistas.get(0)))
		assertTrue(alberto.seniasParticulares.contains(pistas.get(1)))
		print(pistas)
	}
	
	@Test
	def void testToStringDelClubEsClub() {
		assertEquals(club.toString, "Club")
	}
}