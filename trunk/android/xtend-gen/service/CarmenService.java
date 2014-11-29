package service;

import domain.JuegoIniciadoModelApp;
import retrofit.Callback;
import retrofit.http.GET;

@SuppressWarnings("all")
public interface CarmenService {
  /**
   * Rutas del servidor
   * GET     /iniciarJuego                        controllers.Application.iniciarJuego()
   * GET	    /pista/:idJuego/:id					 controllers.Application.getPista(idJuego:Int, id:String)
   * POST    /viajar/:idJuego/:id                 controllers.Application.viajarA(idJuego:Int, id:String)
   * POST    /volverAPaisAnterior/:idJuego        controllers.Application.viajarAPaisAnterior(idJuego:Int)
   * POST    /acusarA/:idJuego/:nombre            controllers.Application.acusarAVillano(idJuego:Int, nombre:String)
   * POST    /finalizarPartida/:idJuego           controllers.Application.finalizarPartida(idJuego:Int)
   */
  @GET("/iniciarJuego")
  public abstract void iniciarJuego(final Callback<JuegoIniciadoModelApp> callback);
}
