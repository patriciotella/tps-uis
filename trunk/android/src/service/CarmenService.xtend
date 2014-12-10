package service

import retrofit.http.GET
import retrofit.http.Path
import retrofit.Callback
import domain.JuegoIniciadoModelApp
import retrofit.http.POST
import domain.Juego
import domain.ResolucionDeJuego

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
	
	@GET("/pista/{idJuego}/{idLugar}")
	def void getPista(@Path("idJuego")Integer id, @Path("idLugar")String idDeLugar, Callback<String> callback)
	
	@POST("/viajar/{idJuego}/{nombreDelPais}")
	def void viajar(@Path("idJuego")Integer id, @Path("nombreDelPais")String idDePais, Callback<Juego> callback)

	@POST("/volverAPaisAnterior/{idJuego}")	
	def void volver(@Path("idJuego")Integer id, Callback<Juego> callback)
	
	@POST("/finalizarPartida/{idJuego}")
	def void finalizarPartida(@Path("idJuego")Integer id, Callback<ResolucionDeJuego> callback)
	
}
