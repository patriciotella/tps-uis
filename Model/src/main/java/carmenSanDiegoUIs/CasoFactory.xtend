package carmenSanDiegoUIs

import pais.Pais
import java.util.Set

class CasoFactory {
	
	def crearCaso(MenuDeAcciones juego, ObjetoRobado unObjetoRobado) {
		val indiceDeVillano = (Math.random() * (juego.villanos.size - 0)).intValue
		val villano  = juego.villanos.get(indiceDeVillano)
		val paises = juego.mapamundi.paises
		val largoRutaDeEscape = (Math.random() * (paises.size - 0)).intValue
		val indiceDelPaisDeComienzo = (Math.random() * (paises.size - 0)).intValue
		var Pais paisAnterior
		var Pais siguientePaisDeLaRuta
		var cantidadDePaisesMarcados = 0
		var paisAMarcar = paises.get(indiceDelPaisDeComienzo)
		val rutaDeEscape = newArrayList
		
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
		
		return new Caso(villano, rutaDeEscape, new Reporte(rutaDeEscape.get(0), unObjetoRobado),
				unObjetoRobado)
	}
	
	def filtrarConexiones(Set<Pais> listaDeConexiones, Pais pais) {
		listaDeConexiones.filter[!equals(pais)]
	}
	
}