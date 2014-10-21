package mapamundi

import java.util.Set
import pais.Pais
import java.util.List

class Mapamundi {
	@Property List<Pais> paises
	
	new() {
		paises = newArrayList()
	}
	
	new(List<Pais> paises) {
		this.paises = paises
	}
	
	def agregarPais(Pais pais) {
		this._paises.add(pais)
	}
	
	def eliminarPais(Pais pais){
		this.paises.remove(pais)
	}
	
}