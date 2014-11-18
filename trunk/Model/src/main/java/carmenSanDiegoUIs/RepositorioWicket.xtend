package carmenSanDiegoUIs

import java.util.ArrayList
import java.util.HashSet
import lugarDeInteres.Banco
import lugarDeInteres.Biblioteca
import lugarDeInteres.Embajada
import lugarDeInteres.LugarDeInteres
import mapamundi.Mapamundi
import pais.Pais
import villano.Expedientes
import villano.Villano
import lugarDeInteres.Club

class RepositorioWicket {

	@Property Mapamundi mapamundi
	@Property Expedientes expedientes

	new() {
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
		val conexiones = new ArrayList<Pais>()
		val lugares = new HashSet<LugarDeInteres>()
		lugares.add(new Banco)
		lugares.add(new Biblioteca)
		lugares.add(new Embajada)
		val caracteristicas = new HashSet<String>()
		caracteristicas.add("holiz")
		caracteristicas.add("chauchiz")
		caracteristicas.add("otra")

		val arg = new Pais("Argentina", caracteristicas, conexiones, lugares)
		val chi = new Pais("Chile", caracteristicas, conexiones, lugares)
		val mex = new Pais("Mexico", caracteristicas, conexiones, lugares)
		val per = new Pais("Peru", caracteristicas, conexiones, lugares)

		conexiones.add(arg)
		conexiones.add(chi)
		conexiones.add(mex)

		val paises = new ArrayList<Pais>()
		paises.add(arg)
		paises.add(chi)
		paises.add(mex)
		paises.add(per)

		val jose = new Villano("jose", "Masculino", caracteristicas, caracteristicas)
		val raul = new Villano("Raul", "Masculino", caracteristicas, caracteristicas)
		val claudia = new Villano("Claudia", "Femenino", caracteristicas, caracteristicas)
		val mirta = new Villano("Mirta", "Femenino", caracteristicas, caracteristicas)

		val villanos = new ArrayList<Villano>()
		villanos.add(jose)
		villanos.add(raul)
		villanos.add(claudia)
		villanos.add(mirta)

//		this.expedientes = new Expedientes(villanos)
//		this.mapamundi = new Mapamundi(paises)
		expedientes = new Expedientes(
			new ArrayList => [
			add(alberto)
			add(carlos)
		])
		mapamundi = new Mapamundi(
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

	}
}
