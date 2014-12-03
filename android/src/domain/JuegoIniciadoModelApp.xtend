package domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JuegoIniciadoModelApp implements Serializable {
	
	Juego juegoActual
	Expedientes expedientesDeVillanos
	
	new(Juego unJuego, Expedientes expedientesDeVillanos){
		juegoActual = unJuego
		this.expedientesDeVillanos = expedientesDeVillanos
	}
}