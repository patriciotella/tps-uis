package controllers;

import carmenSanDiegoUIs.JuegoDefaultFactory;
import carmenSanDiegoUIs.JuegoException;
import carmenSanDiegoUIs.JuegoIniciadoModelApp;
import carmenSanDiegoUIs.RepositorioFactory;
import carmenSanDiegoUIs.ResolverMisterioModelApp;
import pais.Pais;
import play.*;
import play.mvc.*;
import views.html.*;
import villano.Villano;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ObjectNode;

import play.libs.Json;

public class Application extends Controller {
	
	private static ResolverMisterioModelApp servidor = new ResolverMisterioModelApp(RepositorioFactory.repositorioDefault().getExpedientes());

	private static ObjectMapper getMapper(){
		ObjectMapper mapper = new ObjectMapper();
    	mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
    	return mapper;
	}
	
    public static Result iniciarJuego() throws JsonProcessingException {
    	JuegoIniciadoModelApp juego = servidor.iniciarJuego(JuegoDefaultFactory.getJuegoDefault(RepositorioFactory.repositorioDefault()));
    	String juegoJsonString = getMapper().writeValueAsString(juego);
    	return ok(juegoJsonString);
    }
    
    public static Result getPista(int idDeJuego, String nombreDelLugar) {
    	try{
    		String pista = servidor.getPistaDePaisActual(idDeJuego, nombreDelLugar);
    		return ok(Json.toJson(pista));
    	}catch (JuegoException e){
    		return badRequest(e.getMessage());
    	}
    }
    
    public static Result viajarA(int idDeJuego, String nombreDelPaisSeleccionado) throws JsonProcessingException {
    	try{
	    	Pais destino = servidor.getDestino(idDeJuego, nombreDelPaisSeleccionado);
	    	servidor.viajarADestino(idDeJuego, destino);
	    	String juegoActualJsonString = getMapper().writeValueAsString(servidor.getJuegoActual(idDeJuego));
	    	return ok(juegoActualJsonString);
    	}catch (JuegoException e){
    		return badRequest(e.getMessage());
    	}
    }
    
    public static Result viajarAPaisAnterior(int idDeJuego) throws JsonProcessingException {
    	try{
	    	servidor.viajarAlPaisAnterior(idDeJuego);
	    	String juegoActualJsonString = getMapper().writeValueAsString(servidor.getJuegoActual(idDeJuego));
	    	return ok(juegoActualJsonString);
    	}catch (JuegoException e){
    		return badRequest(e.getMessage());
    	}
    }
    
    public static Result acusarAVillano(int idDeJuego, String nombreDelVillano) {
    	try{
	    	Villano villanoParaAcusar = servidor.getVillano(nombreDelVillano);
	    	servidor.emitirOrdenDeArresto(idDeJuego, villanoParaAcusar);
	    	return ok();
    	}catch (JuegoException e){
    		return badRequest(e.getMessage());
    	}
    }
    
    public static Result finalizarPartida(int idDeJuego) throws JsonProcessingException{
    	try{
    		return ok(getMapper().writeValueAsString(servidor.finalizarPartida(idDeJuego)));
    	}catch (JuegoException e){
    		return badRequest(e.getMessage());
    	}
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

