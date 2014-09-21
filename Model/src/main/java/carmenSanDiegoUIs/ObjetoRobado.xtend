package carmenSanDiegoUIs

class ObjetoRobado {
	private String descripcion
	private String descripcionAdicional
	
	new(String descripcionDelObjeto, String descripcionAdicional) {
		descripcion = descripcionDelObjeto
		this.descripcionAdicional = descripcionAdicional
	}
	
	def getDescripcion() {
		descripcion
	}
	
	def getDescripcionCompleta() {
		'''descripcion. descripcionAdicional'''
	}
}