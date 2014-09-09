

import java.util.List

class LugarDeInteres {
	@Property String ocupante
	static val lugares = #["Embajada", "Club", "Biblioteca", "Banco"]
	
	def lugaresPosibles() {
		lugares.asObjects
	}
	
	def asObjects(List<?> list) {
		list.map[it as Object]
	}
	
	def static getLugares(){
		lugares
	}
	
	override toString() {
		this.class.toString.substring(6)
	}
}