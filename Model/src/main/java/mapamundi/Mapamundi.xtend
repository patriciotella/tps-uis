package mapamundi

import java.util.Set
import pais.Pais

class Mapamundi {
	@Property Set<Pais> paises
	
	new() {
		paises = newHashSet()
	}
	
	new(Set<Pais> paises) {
		this.paises = paises
	}
	
	def agregarPais(Pais pais) {
		this._paises.add(pais)
	}
	
	def eliminarPais(Pais pais){
		this.paises.remove(pais)
	}
	
}