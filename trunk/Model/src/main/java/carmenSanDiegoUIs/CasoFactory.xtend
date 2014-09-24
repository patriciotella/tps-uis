package carmenSanDiegoUIs

import pais.Pais
import java.util.Set
import java.util.HashSet

class CasoFactory {
	
	def Caso crearCaso(Sistema unSistema, ObjetoRobado unObjetoRobado) {
		val indiceDeVillano = (Math.random() * (unSistema.villanos.size - 0)).intValue
		val villano  = unSistema.villanos.get(indiceDeVillano)
		val paises = unSistema.mapamundi.paises
		val largoRutaDeEscape = (Math.random() * (paises.size - 0)).intValue
		val indiceDelPaisDeComienzo = (Math.random() * (paises.size - 0)).intValue
		var Pais paisAnterior
		var Pais siguientePaisDeLaRuta
		var cantidadDePaisesMarcados = 0
		var paisAMarcar = paises.get(indiceDelPaisDeComienzo)
		val rutaDeEscape = new HashSet
		
		while(largoRutaDeEscape < cantidadDePaisesMarcados){
			var conexionesSinPaisAnterior = filtrarConexiones(paisAMarcar.conexiones, paisAnterior).toSet
			var indiceDeProximoPais = (Math.random() * (conexionesSinPaisAnterior.size - 0)).intValue
			siguientePaisDeLaRuta = conexionesSinPaisAnterior.get(indiceDeProximoPais)
			paisAMarcar.marcarComoRutaDeEscapeDeVillano(villano, siguientePaisDeLaRuta)
			filtrarConexiones(conexionesSinPaisAnterior, siguientePaisDeLaRuta).toSet.forEach[it.marcarSinVillano]
			rutaDeEscape.add(paisAMarcar)
			paisAnterior = paisAMarcar
			paisAMarcar = siguientePaisDeLaRuta
		}
		
		paisAMarcar.marcarComoUltimoPaisDeLaRutaDelVillano(villano)
		rutaDeEscape.add(paisAMarcar)
		
		unSistema.setRutas(rutaDeEscape)
		
		val nombre = "Robo de " + unObjetoRobado.nombre
		return new Caso(nombre, villano, new Reporte(rutaDeEscape.get(0), unObjetoRobado),
			rutaDeEscape.get(0), unObjetoRobado)
	}
	
	def filtrarConexiones(Set<Pais> listaDeConexiones, Pais pais) {
		listaDeConexiones.filter[!equals(pais)]
	}
	
}