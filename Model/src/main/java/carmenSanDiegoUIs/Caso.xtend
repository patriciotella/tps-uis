package carmenSanDiegoUIs

import java.util.List
import villano.Villano
import pais.Pais
import org.uqbar.commons.utils.Observable

@Observable
class Caso {
	@Property Villano responsable
	@Property List<Pais> planDeEscape
	@Property String reporte
	@Property String objeto
	@Property Pais pais
	
	new () {
		planDeEscape = newArrayList
		reporte = ""
		objeto = ""
	}
}