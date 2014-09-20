package lugarDeInteres

class LugarNoConoceAlMalechor extends EstadoDelLugar {
	
	override pista(LugarDeInteres unLugarDeInteres) {
		throw new LugarNoTieneInformacionDelVillanoException("La persona que busca no pasó por este lugar!")
	}
	
}