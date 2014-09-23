package lugarDeInteres

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.uqbar.commons.model.UserException
import villano.Villano
import pais.Pais

class BancoTest {
	
	Banco unBanco
	
	@Before
	def void setUp() {
		unBanco = new Banco()
	}
	
	@Test
	def void testElBancoNoTieneDatosSobreNingunVillanoYAlPedirleUnaPistaTiraExcepcion() {
		unBanco.noConoceAlVillano
		try{
			unBanco.pista
		}catch (UserException e){
			assertEquals(e.message, "La persona que busca no pasó por este lugar!")			
		}
	}
	
	@Test
	def void testElBancoEsParteDeLaRutaDeEscapeDelVillanoYDevuelveLasPistasDeSuRutaDeEscape() {
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
		unBanco.marcarComoRutaDeEscapeDeVillano(alberto, argentina)
		val pistas = unBanco.pista
		assertEquals(pistas.size, 2)
		assertTrue(argentina.caracteristicas.contains(pistas.get(0)))
		assertTrue(alberto.seniasParticulares.contains(pistas.get(1)))
		print(pistas)
	}
	
	@Test
	def void testToStringDelBancoEsBanco() {
		assertEquals(unBanco.toString, "Banco")
	}
}