package carmenSanDiegoUIs

import mapamundi.Mapamundi
import villano.Expedientes

class HomePageModApp {
	
	@Property
	Mapamundi mapamundi
	
	@Property
	Expedientes expedientes
	
	new(){
		mapamundi = new Mapamundi
		expedientes = new Expedientes
	}
	
}