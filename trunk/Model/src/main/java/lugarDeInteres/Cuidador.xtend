package lugarDeInteres

import org.uqbar.commons.model.UserException

class Cuidador extends Ocupante {
	
	override pista(LugarDeInteres unLugarDeInteres) {
		throw new UserException("La persona que busca no pasó por este lugar!")
	}
	
}