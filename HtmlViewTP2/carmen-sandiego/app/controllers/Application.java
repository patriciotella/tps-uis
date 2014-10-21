package controllers;

import carmenSanDiegoUIs.JuegoDefaultFactory;
import carmenSanDiegoUIs.ResolverMisterioModelApp;
import carmenSanDiegoUIs.XXXFactory;
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
	
	private static ResolverMisterioModelApp xxx = new ResolverMisterioModelApp(XXXFactory.xxxDefault().getExpedientes());

//	iniciarJuego que devuelve un caso + los posibles villanos para pedir la orden de arresto
	
//	pistaDelLugar que espera un lugar y un caso y devuelve la pista

//	emitirOrdenPara que espera un villano y un caso y devuelve ok o nok

//	viajar que espera un destino y un caso y devuelve el nuevo estado del caso
	//(lista de fallidos - viajes posibles - lugares del pais - lugares recorridos)
	
    public static Result prueba() {
		Villano uno = new Villano("", "", null, null);
		return ok();
	}
    
    public static Result iniciarJuego() throws JsonProcessingException {
    	ObjectMapper mapper = new ObjectMapper();
    	mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
    	// do various things, perhaps:
    	xxx.iniciarJuego(JuegoDefaultFactory.getJuegoDefault(XXXFactory.xxxDefault()));
    	String someJsonString = mapper.writeValueAsString(xxx);
    	return ok(someJsonString);
//    	return ok(Json.toJson(xxx));
    }
    
    public static Result pistaDelLugar(String nombreDelLugar) {
    	String pista = xxx.getPistaDePaisActual(nombreDelLugar);
    	return ok(Json.toJson(pista));
    }
    
    public static Result emitirOrdenPara(String villanoNombre) {
    	try{
    		Villano villano = xxx.getVillano(villanoNombre);
    		xxx.emitirOrdenDeArresto(villano);
    		return ok("Orden de arresto emitida correctamente");
    	} catch (RuntimeException e){
    		return notFound("La orden de arresto ya fue emitida");
    	}
    }
    
    public static Result viajar(String nombreDelDestino) {
    	Pais destino = xxx.getDestino(nombreDelDestino);
    	xxx.viajarADestino(destino);
    	return ok(Json.toJson(xxx.getJuegoActual()));
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

