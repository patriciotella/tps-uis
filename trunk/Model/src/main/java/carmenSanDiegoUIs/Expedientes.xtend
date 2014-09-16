package carmenSanDiegoUIs

import java.util.Set
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import villano.Villano

@Observable
class Expedientes {
	@Property Set<Villano> villanos
	
	new() {
		villanos = newHashSet
	}
	
	new(Set<Villano> villanos) {
		this.villanos = villanos
	}
	
	def agregarVillano(Villano villano) {
		this._villanos.add(villano)
		ObservableUtils.firePropertyChanged(this, "villanos", villanos)
		ObservableUtils.firePropertyChanged(this, "tieneVillanos", tieneVillanos)
	}
	
	def isTieneVillanos() {
		!villanos.empty
	}
	
	
}