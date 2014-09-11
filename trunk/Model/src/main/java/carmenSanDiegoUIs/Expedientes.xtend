package carmenSanDiegoUIs

import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.model.ObservableUtils

@Observable
class Expedientes {
	@Property List<Villano> villanos
	
	new() {
		villanos = newArrayList
	}
	
	new(List<Villano> villanos) {
		this.villanos = villanos
	}
	
	def agregarVillano(Villano villano) {
		this._villanos.add(villano)
		ObservableUtils.firePropertyChanged(this, "villanos", villanos)
	}
}