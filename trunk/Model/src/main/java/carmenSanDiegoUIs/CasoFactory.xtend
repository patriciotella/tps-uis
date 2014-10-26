package carmenSanDiegoUIs

import pais.Pais
import java.util.ArrayList
import java.util.List

class CasoFactory {
	
	def Caso crearCaso(Repositorio unSistema) {
//		val indiceDeVillano = (Math.random() * (unSistema.expedientes.size)).intValue
//		val villano  = new ArrayList(unSistema.expedientes).get(indiceDeVillano)
//		val paises = unSistema.mapamundi.paises
//		val largoRutaDeEscape = (Math.random() * (paises.size)).intValue
//		val indiceDelPaisDeComienzo = (Math.random() * (paises.size)).intValue
//		var Pais paisAnterior
//		var Pais siguientePaisDeLaRuta
//		var cantidadDePaisesMarcados = 0
//		var paisAMarcar = new ArrayList(paises).get(indiceDelPaisDeComienzo)
//		val rutaDeEscape = newArrayList
//		
//		while(largoRutaDeEscape < cantidadDePaisesMarcados){
//			var conexionesSinPaisAnterior = filtrarConexiones(new ArrayList(paisAMarcar.conexiones), paisAnterior).toList
//			var indiceDeProximoPais = (Math.random() * (conexionesSinPaisAnterior.size)).intValue
//			siguientePaisDeLaRuta = conexionesSinPaisAnterior.get(indiceDeProximoPais)
//			paisAMarcar.marcarComoRutaDeEscapeDeVillano(villano, siguientePaisDeLaRuta)
//			filtrarConexiones(conexionesSinPaisAnterior, siguientePaisDeLaRuta).forEach[it.marcarSinVillano]
//			rutaDeEscape.add(paisAMarcar)
//			paisAnterior = paisAMarcar
//			paisAMarcar = siguientePaisDeLaRuta
//		}
//		
//		paisAMarcar.marcarComoUltimoPaisDeLaRutaDelVillano(villano)
//		rutaDeEscape.add(paisAMarcar)
//		var objetoRobado =  new ArrayList(unSistema.posiblesObjetosRobados).get((Math.random() * (unSistema.posiblesObjetosRobados.size)).intValue)
//		val nombre = "Robo de " + objetoRobado.nombre
//		return new Caso(nombre, villano, new Reporte(rutaDeEscape.get(0), objetoRobado),
//			rutaDeEscape.get(0), objetoRobado)
	}
	
	def filtrarConexiones(List<Pais> listaDeConexiones, Pais pais) {
		listaDeConexiones.filter[!equals(pais)]
	}
	
	/**
	 * Necesita un largo de 6 países por lo menos, con 2 conexiones cada uno.
	 */
	def crearCasoDefault(Repositorio repositorio) {
		val villano  = repositorio.villanos.get(0)
		val paises = repositorio.paises
		var Pais paisAnterior
		var Pais siguientePaisDeLaRuta
		val rutaDeEscape = newArrayList
		var paisAMarcar = new ArrayList(paises).get(0)
		
		while(rutaDeEscape.size < 3){
			var conexionesSinPaisAnterior = filtrarConexiones(new ArrayList(paisAMarcar.conexiones), paisAnterior).toList
			siguientePaisDeLaRuta = conexionesSinPaisAnterior.get(0)
			paisAMarcar.marcarComoRutaDeEscapeDeVillano(villano, siguientePaisDeLaRuta)
			filtrarConexiones(conexionesSinPaisAnterior, siguientePaisDeLaRuta).forEach[it.marcarSinVillano]
			rutaDeEscape.add(paisAMarcar)
			paisAnterior = paisAMarcar
			paisAMarcar = siguientePaisDeLaRuta
		}
		
		paisAMarcar.marcarComoUltimoPaisDeLaRutaDelVillano(villano)
		rutaDeEscape.add(paisAMarcar)
		var objetoRobado =  new ArrayList(repositorio.posiblesObjetosRobados).get(0)
		val nombre = "Robo de " + objetoRobado.nombre
		
		return new Caso(nombre, villano, new Reporte(rutaDeEscape.get(0), objetoRobado),
			rutaDeEscape.get(0), objetoRobado, rutaDeEscape.toSet)
	}
	
}