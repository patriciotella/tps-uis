package service

import retrofit.http.GET
import retrofit.http.Path
import retrofit.Callback
import domain.JuegoIniciadoModelApp
import retrofit.http.POST

interface CarmenService {

/*
Rutas del servidor
GET     /iniciarJuego                        controllers.Application.iniciarJuego()
GET	    /pista/:idJuego/:id					 controllers.Application.getPista(idJuego:Int, id:String)
POST    /viajar/:idJuego/:id                 controllers.Application.viajarA(idJuego:Int, id:String)
POST    /volverAPaisAnterior/:idJuego        controllers.Application.viajarAPaisAnterior(idJuego:Int)
POST    /acusarA/:idJuego/:nombre            controllers.Application.acusarAVillano(idJuego:Int, nombre:String)
POST    /finalizarPartida/:idJuego           controllers.Application.finalizarPartida(idJuego:Int)
 */
 
	@GET("/iniciarJuego")
	def void iniciarJuego(Callback<JuegoIniciadoModelApp> callback)
	
	@POST("/acusarA/{idJuego}/{nombre}")
	def void acusarVillano(@Path("idJuego")Integer id, @Path("nombre")String nombreDeVillano, Callback<String> callback)
}
