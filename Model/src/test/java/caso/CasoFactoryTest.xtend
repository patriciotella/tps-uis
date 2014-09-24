package caso

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import villano.Villano
import pais.Pais
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import lugarDeInteres.Biblioteca
import java.util.HashSet
import mapamundi.Mapamundi
import carmenSanDiegoUIs.ObjetoRobado
import carmenSanDiegoUIs.Sistema

class SistemaTest {
	
	Villano alberto
	Villano carlos
	Pais argentina
	Pais brasil
	Pais chile
	Pais uruguay
	Sistema unSistema
	
	def void crearVillanos() {
		alberto = new Villano("Alberto", "Masculino",
			newHashSet => [add("Seña") add("Otra seña")],
			newHashSet => [add("Jugador")]
		)
		carlos = new Villano("Carlos", "Masculino",
			newHashSet => [add("Guiña el ojo") add("Aplaude")],
			newHashSet => [add("Hacker")]
		)
	}
	
	def void crearPaises() {
		brasil = new Pais("Brasil", 
			newHashSet => [add("Tiene playa")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		argentina = new Pais("Argentina", 
			newHashSet => [add("Toman mate")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		uruguay = new Pais("Uruguay", 
			newHashSet => [add("Algo")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Biblioteca)
			]
		)
		chile = new Pais("Chile", 
			newHashSet => [add("Malos al futbol")],
			newHashSet, newHashSet => [
				add(new Club) add(new Biblioteca) add(new Banco)
			]
		)
	}
	
	@Before
	def void setUp() {
		crearVillanos
		crearPaises
		val mapamundi = new Mapamundi(
			new HashSet => [
				add(argentina)
				add(chile)
				add(brasil)
				add(uruguay)
			]
		)		
		val objetosRobados = new HashSet => [
			add(new ObjetoRobado("Tumba del faraón", "El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III"))
		]
		val villanos = new HashSet => [
			add(alberto)
			add(carlos)
		]
		unSistema = new Sistema(mapamundi, villanos, objetosRobados)
	}
	
	@Test
	def void test(){
		unSistema.crearCaso
		assertEquals(unSistema.caso.getObjetoRobado.nombre, "Tumba del faraón")
		assertTrue(unSistema.mapamundi.paises.contains(unSistema.caso.paisDondeOcurrio))
	}
	
}