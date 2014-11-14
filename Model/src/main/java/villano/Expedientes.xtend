package villano

import java.util.List
import java.io.Serializable

class Expedientes implements Serializable {
	@Property List<Villano> villanos;
	
	new() {
		villanos = newArrayList()
	}
	
	new(List<Villano> villanos) {
		this.villanos = villanos
	}
	
	def agregarVillano(Villano unVillano) {
		villanos.add(unVillano)
	}
	
	def eliminarVillano(Villano unVillano){
		villanos.remove(unVillano)
	}
	
	def getVillanoPorNombre(String nombreDeVillano) {
		val villanoConNombre = villanos.filter[nombre == nombreDeVillano]
		if(villanoConNombre.empty)
			throw new RuntimeException
		else
			villanoConNombre.head
	}
	
}