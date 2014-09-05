

import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.model.ObservableUtils

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
		_paises.add(pais)
		ObservableUtils.firePropertyChanged(this, "paises", paises)
	}
}