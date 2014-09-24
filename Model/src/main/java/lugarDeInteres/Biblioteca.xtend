package lugarDeInteres


class Biblioteca extends LugarDeInteres {
	
	new() {
		super()
	}
	
	override darPistaSegunPolitica() {
		val randomInt = (Math.random() * ( pais.caracteristicas.size - 0 )).intValue
		val anotherRandomInt = (Math.random() * (villano.seniasParticulares.size - 0)).intValue
		val probabilidades = (Math.random() * ( 3 - 1 )).intValue
		
		val pistas = "Vi a alguien como describe" +
		villano.seniasParticulares.get(anotherRandomInt)
		
		if(probabilidades % 2 == 0) {
			val rand = (Math.random() * (villano.hobbies.size - 0)).intValue
			pistas + ". " + (villano.hobbies.get(rand))
		}
		
		pistas + ". " + pais.caracteristicas.get(randomInt)
		
		return pistas
		/*
		 * Cuando tiene información del malechor da una pista sobre el país
		 * hacia donde se dirigió y sobre sus señas particulares. Además tiene
		 * 50% de chance de dar una pista más sobre sus hobbies.
		 */
	}
	
}