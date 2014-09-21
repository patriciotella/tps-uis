package lugarDeInteres


class Biblioteca extends LugarDeInteres {
	
	override darPista() {
		val randomInt = (Math.random() * ( pais.caracteristicas.size - 0 )).intValue
		val anotherRandomInt = (Math.random() * (villano.seniasParticulares.size - 0)).intValue
		val probabilidades = (Math.random() * ( 3 - 1 )).intValue
		val pistas = newArrayList
		pistas.add("Características: ")
		pistas.add(pais.caracteristicas.get(randomInt))
		pistas.add("Señas particulares: ")
		pistas.add(villano.seniasParticulares.get(anotherRandomInt))
		
		if(probabilidades % 2 == 0) {
			val rand = (Math.random() * (villano.hobbies.size - 0)).intValue
			pistas.add("Hobbies: ")
			pistas.add(villano.hobbies.get(rand))
		}
		
		pistas
		/*
		 * Cuando tiene información del malechor da una pista sobre el país
		 * hacia donde se dirigió y sobre sus señas particulares. Además tiene
		 * 50% de chance de dar una pista más sobre sus hobbies.
		 */
	}
	
}