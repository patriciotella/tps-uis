package mapamundi

import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import pais.Pais

@Observable
class Mapamundi {
	@Property List<Pais> paises
	
	new() {
		paises = newArrayList
	}
	
	new(List<Pais> paises) {
		this.paises = paises
	}
	
	def agregarPais(Pais pais) {
		this._paises.add(pais)
		ObservableUtils.firePropertyChanged(this, "paises", paises)
	}
}