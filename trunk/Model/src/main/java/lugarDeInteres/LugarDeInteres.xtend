package lugarDeInteres 


abstract class LugarDeInteres {
	@Property String ocupante
	
	override toString() {
		this.class.toString.substring(21)
	}
}