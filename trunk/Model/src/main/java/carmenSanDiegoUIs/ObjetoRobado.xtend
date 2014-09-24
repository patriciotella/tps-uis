package carmenSanDiegoUIs

class ObjetoRobado {
	private String nombre
	private String descripcion
	
	new(String nombreDelObjeto, String descripcionDelObjeto) {
		nombre = nombreDelObjeto
		this.descripcion = descripcionDelObjeto
	}
	
	def getNombre() {
		nombre
	}
	
	def getDescripcionCompleta() {
		descripcion
	}
}