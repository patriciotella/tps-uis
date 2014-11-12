package carmenSanDiegoUIs

import java.util.ArrayList
import java.util.HashSet
import lugarDeInteres.Banco
import lugarDeInteres.Biblioteca
import lugarDeInteres.Embajada
import lugarDeInteres.LugarDeInteres
import mapamundi.Mapamundi
import pais.Pais
import villano.Expedientes
import villano.Villano

class RepositorioWicket {
	
	@Property Mapamundi mapamundi
	@Property Expedientes expedientes
	
	new(){
	
	val conexiones = new ArrayList<Pais>()
	val lugares = new HashSet<LugarDeInteres>()
	lugares.add(new Banco)
	lugares.add(new Biblioteca)
	lugares.add(new Embajada)
	val caracteristicas = new HashSet<String>()
	caracteristicas.add("holiz")
	caracteristicas.add("chauchiz")
	caracteristicas.add("otra")
	
	val arg = new Pais("Argentina",caracteristicas,conexiones,lugares)
	val chi = new Pais("Chile",caracteristicas,conexiones,lugares)
	val mex = new Pais("Mexico",caracteristicas,conexiones,lugares)
	val per = new Pais("Peru",caracteristicas,conexiones,lugares)
	
	conexiones.add(arg)
	conexiones.add(chi)
	conexiones.add(mex)
	
	val paises = new ArrayList<Pais>()
	paises.add(arg)
	paises.add(chi)
	paises.add(mex)
	paises.add(per)
	
	val jose = new Villano("jose","Masculino",caracteristicas,caracteristicas)
	val raul = new Villano("Raul","Masculino",caracteristicas,caracteristicas)
	val claudia = new Villano("Claudia","Femenino",caracteristicas,caracteristicas)
	val mirta = new Villano("Mirta","Femenino",caracteristicas,caracteristicas)
	
	val villanos = new ArrayList<Villano>()
	villanos.add(jose)
	villanos.add(raul)
	villanos.add(claudia)
	villanos.add(mirta)
	
	this.expedientes = new Expedientes(villanos)
	this.mapamundi = new Mapamundi(paises)
	
	}
}