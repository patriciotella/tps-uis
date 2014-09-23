package lugarDeInteres

import org.uqbar.commons.model.UserException

class LugarNoConoceAlMalechor extends EstadoDelLugar {
	
	override pista(LugarDeInteres unLugarDeInteres) {
		throw new UserException("La persona que busca no pasó por este lugar!")
	}
	
}