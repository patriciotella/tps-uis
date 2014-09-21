package villano

import org.uqbar.commons.utils.Observable
import java.util.Set

@Observable
class EditorDeVillano {
	
	@Property Villano villano
//	@Property Expediente expediente
	@Property Set<Villano> villanos
	
	new(Villano unVillano, Set<Villano> villanos){
		villano = unVillano
		_villanos = villanos
	}
	
	def agregarVillano(Villano unVillano){
		_villanos.add(unVillano)
	}
	
	def puedeCrearVillano(){
		villano.nombre!=""
	}
}