package lugarDeInteres


class Banco extends LugarDeInteres {
	
	new() {
		super()
	}
	
	override protected darPistaSegunPolitica() {
		(Math.random() * (pais.caracteristicas.size - 0)).intValue
		val randomInt = (Math.random() * (pais.caracteristicas.size - 0)).intValue
		val anotherRandomInt = (Math.random() * (villano.seniasParticulares.size - 0)).intValue

		"Vi a alguien como describe " +  
		villano.seniasParticulares.get(anotherRandomInt) + ". " +
		pais.caracteristicas.get(randomInt)
	}
		
		/*
		 * Cuando tiene información del malechor da una pista sobre el país
		 * hacia donde se dirigió y otra sobre sus señas particulares.
		 */

}