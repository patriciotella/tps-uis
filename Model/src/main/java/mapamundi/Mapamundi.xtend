package mapamundi

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import pais.Pais
import java.util.Set

@Observable
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
		ObservableUtils.firePropertyChanged(this, "paises", paises)
//		ObservableUtils.firePropertyChanged(this, "tienePaises", tienePaises)
	}
	
	def eliminarPais(Pais pais){
		this.paises.remove(pais)
		ObservableUtils.firePropertyChanged(this,"paises",paises)
//		ObservableUtils.firePropertyChanged(this, "tienePaises", tienePaises)
	}
		
//	def isTienePaises() {
//		!paises.empty
//	}
	
}