package defaultBehavior

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import carmenSanDiegoUIs.Repositorio
import villano.Expedientes
import java.util.ArrayList
import carmenSanDiegoUIs.ObjetoRobado
import java.util.HashSet
import mapamundi.Mapamundi
import lugarDeInteres.Biblioteca
import lugarDeInteres.Embajada
import lugarDeInteres.Club
import pais.Pais
import lugarDeInteres.Banco
import villano.Villano
import carmenSanDiegoUIs.Juego

class CasoFactoryTest {
	
	Repositorio repositorio
	Pais argentina
	Villano alberto
	
	@Before
	def void setUp(){
		alberto = new Villano(
			"Alberto",
			"Masculino",
			newHashSet => [add("Seña") add("Otra seña")],
			newHashSet => [add("Jugador")]
		)
		val carlos = new Villano(
			"Carlos",
			"Masculino",
			newHashSet => [add("Guiña el ojo") add("Aplaude")],
			newHashSet => [add("Hacker")]
		)
		
		val brasil = new Pais(
			"Brasil",
			newHashSet => [add("Tiene playa")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Banco)
				add(new Embajada)
			]
		)
		argentina = new Pais(
			"Argentina",
			newHashSet => [add("Toman mate")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Banco)
				add(new Embajada)
			]
		)
		val uruguay = new Pais(
			"Uruguay",
			newHashSet => [add("Algo")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Banco)
				add(new Biblioteca)
			]
		)
		val chile = new Pais(
			"Chile",
			newHashSet => [add("Malos al futbol")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Biblioteca)
				add(new Banco)
			]
		)
		val egipto = new Pais(
			"Egipto",
			newHashSet => [add("Hay piramides")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Embajada)
				add(new Banco)
			]
		)
		val rusia = new Pais(
			"Rusia",
			newHashSet => [add("Tiene la plaza Roja")],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val mexico = new Pais(
			"Mexico",
			newHashSet => [
				add("Tiene tacos")
				add("Beben tequila")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val colombia = new Pais(
			"Colombia",
			newHashSet => [
				add("Valderrama jugaba en su selección de futbol")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val francia = new Pais(
			"Francia",
			newHashSet => [
				add("Zidane jugaba al futbol ahí")
				add("Para que bañarse, hay perfume")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val alemania = new Pais(
			"Alemania",
			newHashSet => [
				add("Pais elegido por Javi")
				add("Participaron en la 2da guerra")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val eeuu = new Pais(
			"Estado Unidos",
			newHashSet => [
				add("Bandera con 50 estrellas")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)
		val cuba = new Pais(
			"Cuba",
			newHashSet => [
				add("Los muchachos de Fidel")
			],
			newArrayList,
			newHashSet => [
				add(new Embajada)
				add(new Club)
				add(new Biblioteca)
			]
		)

		argentina.agregarConexion(chile)
		argentina.agregarConexion(brasil)
		
		chile.agregarConexion(rusia)
		chile.agregarConexion(mexico)
		
		brasil.agregarConexion(colombia)
		brasil.agregarConexion(egipto)
		
		rusia.agregarConexion(eeuu)
		rusia.agregarConexion(alemania)
		
		eeuu.agregarConexion(uruguay)
		eeuu.agregarConexion(cuba)
		val mapamundi = new Mapamundi(
			new ArrayList => [
				add(argentina)
				add(chile)
				add(brasil)
				add(uruguay)
				add(egipto)
				add(rusia)
				add(mexico)
				add(colombia)
				add(francia)
				add(eeuu)
				add(alemania)
				add(cuba)
			]
		)
		val objetosRobados = new HashSet => [
			add(
				new ObjetoRobado("Tumba del faraón",
					"El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III"))
		]
		val villanos = new ArrayList => [
			add(alberto)
			add(carlos)
		]
		val expedientes = new Expedientes(villanos)
		
		repositorio = new Repositorio(mapamundi, expedientes, objetosRobados)
	}
	
	@Test
	def void test(){
		val juego = new Juego(repositorio)
		assertEquals(juego.paisActual, argentina)
		assertEquals(juego.getCaso.responsable, alberto)
	}
}