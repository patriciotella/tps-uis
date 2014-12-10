package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable

@Accessors
class ResolucionDeJuego implements Serializable {

	String nombreDelCaso
	String nombreDelObjetoRobado
	String villanoAcusado
	String culpableDelRobo
	String resolucionDePartida

}