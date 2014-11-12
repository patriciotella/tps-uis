package carmenSanDiegoUIs

import mapamundi.Mapamundi
import villano.Expedientes

class HomePageModApp {
	
	@Property
	Mapamundi mapamundi
	
	@Property
	Expedientes expedientes
	
	new(){
		val repo = new RepositorioWicket
		mapamundi = repo.mapamundi
		expedientes = repo.expedientes
	}
	
}