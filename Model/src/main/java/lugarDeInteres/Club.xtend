package lugarDeInteres


class Club extends LugarDeInteres {
	
	new() {
		super()
	}
	
	override darPistaSegunPolitica() {
		val high = villano.seniasParticulares.size
		var randomInt = (Math.random() * ( high - 0 )).intValue
		var anotherRandomInt = (Math.random() * ( high - 0 )).intValue
		while (randomInt == anotherRandomInt) {
			anotherRandomInt = (Math.random() * ( high - 0 )).intValue
		}
		
		var pistas = "Vi a alguien como describe " +
		villano.seniasParticulares.get(randomInt) + ". " +
		villano.seniasParticulares.get(anotherRandomInt)
		if(((Math.random() * ( 9 - 0 )).intValue) <= 6) {
			val index = (Math.random() * (villano.hobbies.size - 0)).intValue
			pistas + ". " + villano.hobbies.get(index)
		}
		return pistas
		/*
		 * Cuando tiene información del malechor da dos pistas sobre sus señas
		 * particulares y el 70% de las veces agrega información sobre sus
		 * hobbies.
		 */
	}
	
}