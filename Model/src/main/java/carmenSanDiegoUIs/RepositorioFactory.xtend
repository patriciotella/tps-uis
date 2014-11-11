package carmenSanDiegoUIs

import villano.Villano
import pais.Pais
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import lugarDeInteres.Biblioteca
import mapamundi.Mapamundi
import java.util.HashSet
import villano.Expedientes
import java.util.ArrayList

class RepositorioFactory {
	
	def static Repositorio repositorioDefault(){
		val alberto = new Villano(
			"Alberto",
			"Masculino",
			newHashSet => [add("es alto") add("es pelado")],
			newHashSet => [add("es jugador")]
		)
		val carlos = new Villano(
			"Carlos",
			"Masculino",
			newHashSet => [add("guiña el ojo") add("aplaude")],
			newHashSet => [add("es hacker")]
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
		val argentina = new Pais(
			"Argentina",
			newHashSet => [add("tomar mate") add("bailar tango")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Banco)
				add(new Embajada)
			]
		)
		val uruguay = new Pais(
			"Uruguay",
			newHashSet => [add("visitar una murga")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Banco)
				add(new Biblioteca)
			]
		)
		val chile = new Pais(
			"Chile",
			newHashSet => [add("ver partidos malos de futbol")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Biblioteca)
				add(new Banco)
			]
		)
		val egipto = new Pais(
			"Egipto",
			newHashSet => [add("ver piramides")],
			newArrayList,
			newHashSet => [
				add(new Club)
				add(new Embajada)
				add(new Banco)
			]
		)
		val rusia = new Pais(
			"Rusia",
			newHashSet => [add("ver la plaza Roja")],
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
				add("comer tacos")
				add("beber tequila")
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
		
		new Repositorio(mapamundi, expedientes, objetosRobados)
	}

}