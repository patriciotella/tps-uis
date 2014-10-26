package defaultBehavior

import carmenSanDiegoUIs.Juego
import carmenSanDiegoUIs.ObjetoRobado
import carmenSanDiegoUIs.Repositorio
import java.util.ArrayList
import java.util.HashSet
import lugarDeInteres.Banco
import lugarDeInteres.Biblioteca
import lugarDeInteres.Club
import lugarDeInteres.Embajada
import mapamundi.Mapamundi
import org.junit.Before
import org.junit.Test
import pais.Pais
import villano.Expedientes
import villano.Villano

import static org.junit.Assert.*

class CasoFactoryTest {
	
	Repositorio repositorio
	Pais argentina
	Villano alberto
	Juego juego
	
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
			"Estados Unidos",
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
		juego = new Juego(repositorio)
	}
	
	@Test
	def void test(){
		assertEquals(juego.paisActual, argentina)
		assertEquals(juego.getCaso.responsable, alberto)
	}
	
	@Test
	def void test2(){
		val ultimoPaisDeRutaDeEscape = juego.caso.planDeEscape.last
		assertEquals(ultimoPaisDeRutaDeEscape.nombre, "Estados Unidos")
		assertEquals(ultimoPaisDeRutaDeEscape.getPistaDeLugar("Embajada"), "Tenga cuidado, el villano está en el lugar")
		assertEquals(ultimoPaisDeRutaDeEscape.getPistaDeLugar("Club"), "CUIDADO DETECTIVE! Ha estado a punto de caer en una trampa... la persona que busca está en la ciudad.")
	}
}