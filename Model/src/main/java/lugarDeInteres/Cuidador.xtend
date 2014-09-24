package lugarDeInteres

import java.util.LinkedList

class Cuidador extends Ocupante {
	
	override pista(LugarDeInteres unLugarDeInteres) {
		new LinkedList => [
			add("Lo siento, crea que se ha equivocado de ciudad, no hay nadie con esas características.")
		]
	}
	
}