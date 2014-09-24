package lugarDeInteres

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.uqbar.commons.model.UserException
import villano.Villano
import pais.Pais

class EmbajadaTest {
	
	Embajada unaEmbajada
	Villano alberto
	Pais argentina
	
	@Before
	def void setUp() {
		unaEmbajada = new Embajada
		alberto = new Villano("Alberto", "Masculino",
			newHashSet => [add("Seña") add("Otra seña")],
			newHashSet => [add("Jugador")]
		)
		argentina = new Pais("Argentina", 
			newHashSet => [add("Toman mate")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
	}
	
	@Test
	def void testElBancoNoTieneDatosSobreNingunVillanoYAlPedirleUnaPistaTiraExcepcion() {
		unaEmbajada.noConoceAlVillano
		try{
			unaEmbajada.pista
		}catch (UserException e){
			assertEquals(e.message, "Lo siento, crea que se ha equivocado de ciudad, no hay nadie con esas características.")			
		}
	}
	
	@Test
	def void testLaEmbajadaEsParteDeLaRutaDeEscapeDelVillanoYDevuelveUnaPistaSiElPaisTieneUnaSolaCaracteristica() {
		unaEmbajada.marcarComoRutaDeEscapeDeVillano(alberto, argentina)
		var pistas = unaEmbajada.pista
		assertEquals(pistas.size, 1)
		assertTrue(argentina.caracteristicas.contains(pistas.get(0)))
	}
	
	@Test
	def void testLaEmbajadaEsParteDeLaRutaDeEscapeDelVillanoYDevuelveDosPistasSiElPaisTieneMasDeUnaCaracteristica(){
		unaEmbajada.marcarComoRutaDeEscapeDeVillano(alberto, argentina)
		argentina.agregarCaracteristica("Hay dulce de leche")
		argentina.agregarCaracteristica("Tiene la 9 de Julio")
		var pistas = unaEmbajada.pista
		assertEquals(pistas.size, 2)
		assertTrue(argentina.caracteristicas.contains(pistas.get(0)))
		assertTrue(argentina.caracteristicas.contains(pistas.get(1)))
		print(pistas)
	}
	
	@Test
	def void testToStringDeLaEmbajadaEsEmbajada() {
		assertEquals(unaEmbajada.toString, "Embajada")
	}
}