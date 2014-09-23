package lugarDeInteres


class Banco extends LugarDeInteres {
	
	def Banco() {
		super
	}
	
	override protected darPista() {
		(Math.random() * (pais.caracteristicas.size - 0)).intValue
		val randomInt = (Math.random() * (pais.caracteristicas.size - 0)).intValue
		val anotherRandomInt = (Math.random() * (villano.seniasParticulares.size - 0)).intValue

		val pistas = newArrayList
//		pistas.add("Características: ")
		pistas.add(pais.caracteristicas.get(randomInt))
//		pistas.add("Señas particulares: ")
		pistas.add(villano.seniasParticulares.get(anotherRandomInt))
		
		pistas
		/*
		 * Cuando tiene información del malechor da una pista sobre el país
		 * hacia donde se dirigió y otra sobre sus señas particulares.
		 */
	}

}