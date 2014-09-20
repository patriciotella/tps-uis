package lugarDeInteres


class Club extends LugarDeInteres {
	
	override darPista() {
		val high = villano.seniasParticulares.size
		var randomInt = (Math.random() * ( high - 0 )) as Integer
		var anotherRandomInt = (Math.random() * ( high - 0 )) as Integer
		while (randomInt == anotherRandomInt)
			anotherRandomInt = (Math.random() * ( high - 0 )) as Integer
		var pistas = newArrayList
		pistas.add("Señas particulares: ")
		pistas.add(villano.seniasParticulares.get(randomInt))
		pistas.add(villano.seniasParticulares.get(anotherRandomInt))
		if(((Math.random() * ( 9 - 0 )) as Integer) <= 6) {
			val index = (Math.random() * (villano.hobbies.size - 0)) as Integer
			pistas.add(villano.hobbies.get(index))	
		}
		return pistas
		/*
		 * Cuando tiene información del malechor da dos pistas sobre sus señas
		 * particulares y el 70% de las veces agrega información sobre sus
		 * hobbies.
		 */
	}
	
}