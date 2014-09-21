package lugarDeInteres


class Embajada extends LugarDeInteres {

	override darPista() {
		val high = pais.caracteristicas.size
		var randomInt = (Math.random() * ( high - 0 )).intValue
		var anotherRandomInt = (Math.random() * ( high - 0 )).intValue
		
		while (randomInt == anotherRandomInt){
			anotherRandomInt = (Math.random() * ( high - 0 )).intValue
		}
		
		var pistas = newArrayList
		pistas.add("Características del país: ")
		pistas.add(pais.caracteristicas.get(randomInt))
		pistas.add(pais.caracteristicas.get(anotherRandomInt))
		
		pistas
	// Cuando tiene información del malechor da 2 pistas 
	// sobre el país hacia donde se dirigió.
	}

}
