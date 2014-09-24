package lugarDeInteres


class Embajada extends LugarDeInteres {

	new() {
		super()
	}
	
	override darPistaSegunPolitica() {
		val high = pais.caracteristicas.size
		var randomInt = (Math.random() * ( high - 0 )).intValue
		
		var pistas = "Vi a alguien como describe, estaba interesado en " +
		pais.caracteristicas.get(randomInt)
		
		if(pais.caracteristicas.size > 1) {
			var anotherRandomInt = (Math.random() * ( high - 0 )).intValue
			while (randomInt == anotherRandomInt){
				anotherRandomInt = (Math.random() * ( high - 0 )).intValue
			}
			
			pistas + " y " + pais.caracteristicas.get(anotherRandomInt)
		}
		
		pistas
	// Cuando tiene información del malechor da 2 pistas 
	// sobre el país hacia donde se dirigió.
	}

}
