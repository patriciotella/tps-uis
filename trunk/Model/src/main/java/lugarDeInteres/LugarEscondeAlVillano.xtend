package lugarDeInteres

import lugarDeInteres.EstadoDeLugarDeInteres

class LugarEscondeAlVillano implements EstadoDeLugarDeInteres {
	
	override pista(LugarDeInteres lugarDeInteres) {
		throw new ElVillanoEstaEnElLugarException("Tenga cuidado, el villano está en el lugar")
	}
	
}