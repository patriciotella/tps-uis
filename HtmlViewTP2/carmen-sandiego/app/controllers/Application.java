package controllers;

import carmenSanDiegoUIs.JuegoDefaultFactory;
import carmenSanDiegoUIs.JuegoIniciadoModelApp;
import carmenSanDiegoUIs.ResolverMisterioModelApp;
import carmenSanDiegoUIs.XXXFactory;
import pais.Pais;
import play.*;
import play.mvc.*;
import views.html.*;
import villano.Villano;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ObjectNode;

import play.libs.Json;

public class Application extends Controller {
	
	private static ResolverMisterioModelApp xxx = new ResolverMisterioModelApp(XXXFactory.xxxDefault().getExpedientes());

    public static Result iniciarJuego() throws JsonProcessingException {
    	ObjectMapper mapper = new ObjectMapper();
    	mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
    	// do various things, perhaps:
    	JuegoIniciadoModelApp juego = xxx.iniciarJuego(JuegoDefaultFactory.getJuegoDefault(XXXFactory.xxxDefault()));
    	String someJsonString = mapper.writeValueAsString(juego);
    	return ok(someJsonString);
    }
    
    public static Result getPista(int idDeJuego, String nombreDelLugar) {
    	return ok(Json.toJson(xxx.getPistaDePaisActual(idDeJuego, nombreDelLugar)));
    }
    
    public static Result viajarA(int idDeJuego, String nombreDelPaisSeleccionado) throws JsonProcessingException {
    	Pais destino = xxx.getDestino(idDeJuego, nombreDelPaisSeleccionado);
    	ObjectMapper mapper = new ObjectMapper();
    	mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
    	xxx.viajarADestino(idDeJuego, destino);
    	String juegoActualJsonString = mapper.writeValueAsString(xxx.getJuegoActual(idDeJuego));
    	return ok(juegoActualJsonString);
    }
    
    public static Result viajarAPaisAnterior(int idDeJuego) throws JsonProcessingException {
    	ObjectMapper mapper = new ObjectMapper();
    	mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
    	xxx.getJuegoActual(idDeJuego).viajarAlPaisAnterior();
    	String juegoActualJsonString = mapper.writeValueAsString(xxx.getJuegoActual(idDeJuego));
    	return ok(juegoActualJsonString);
    }
    
    public static Result acusarAVillano(int idDeJuego, String nombreDelVillano) {
    	Villano villanoParaAcusar = xxx.getVillano(nombreDelVillano);
    	xxx.emitirOrdenDeArresto(idDeJuego, villanoParaAcusar);
    	return ok();
    }
    
    //***********************************************************
    protected static ObjectNode crearJsonError(String message) {
    	ObjectNode result = Json.newObject();
		result.put("error", message);
		return result;
	}
    
    protected static ObjectNode crearJsonOk() {
    	ObjectNode result = Json.newObject();
		result.put("status", "OK");
		return result;
	}

}

