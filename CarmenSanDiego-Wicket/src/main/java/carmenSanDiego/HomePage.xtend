package carmenSanDiego;

import mapamundi.Mapamundi
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XForm
import pais.EditorDePais
import org.apache.wicket.markup.html.form.DropDownChoice

/**
 * Homepage
 */
public class HomePage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	new(){
		val form = new XForm<EditorDePais>("EditorDePaisForm", new CompoundPropertyModel(new EditorDePais(new Mapamundi)))	
	
	
		this.addChild(form)
		this.addFields(form)
		this.addActions(form)
	}
	
	def addFields(Form<EditorDePais> form) {
		
//		FALTA AGREGAR LAS PROPERTIES DE LUGAR DE INTERES Y CONEXION PARA PODER MANIPULARLAS DESDE ACA
		form.addChild(crearNombrePaisTextField(form))
//		form.addChild(crearCaracteristicasPaisTextField(form))
		form.addChild(new DropDownChoice<EditorDePais>("caracteristicas") => [
//			choices = loadableModel([| EditorDePais.caracteristicas ])
			choiceRenderer = choiceRenderer([EditorDePais m| m.caracteristicas ])
		]) //ESTO SE ME COMPLICO 
//		VER LISTAS EN EJEMPLO DE CELULARES PARA LISTA DE CARACTERISTICAS
		form.addChild(crearCaracteristicaPaisTextField(form))
//		VER LISTAS EN EJEMPLO DE CELULARES PARA LISTA DE CONEXIONES
//		form.addChild(crearConexionPaisTextField(form))
//		VER LISTAS EN EJEMPLO DE CELULARES PARA LISTA DE LUGAR DE INTERES
//		form.addChild(crearLugarDeInteresPaisTextField(form))
//		form.addChild(new FeedbackPanel("feedbackPanel")) //ESTE ES EL QUE MUESTRA ERRORES
	}
	
	def crearNombrePaisTextField(Form<EditorDePais> form) {

		val nombrePaisTextField = new TextField<String>("nombre")
		return nombrePaisTextField
	}
	
	def crearCaracteristicaPaisTextField(Form<EditorDePais> form) {
		
		val caracteristicaPaisTextField = new TextField<String>("caracteristica")
		return caracteristicaPaisTextField
	}
	
//	def crearCaracteristicasPaisTextField(Form<EditorDePais> form) {
//		
//		val caracteristicasPaisTextField = new TextField<String>("caracteristicas")
//		return caracteristicasPaisTextField
//	}
//	
//	def crearConexionPaisTextField(Form<EditorDePais> form) {
//		
//		val conexionPaisTextField = new TextField<String>("conexion")
//		return conexionPaisTextField
//	}
//	
//	def crearLugarDeInteresPaisTextField(Form<EditorDePais> form) {
//		
//		val lugarDeInteresPaisTextField = new TextField<String>("lugarDeInteres")
//		return lugarDeInteresPaisTextField
//	}
	
	def addActions(Form<EditorDePais> form) {
		val caracteristicaButton = new XButton("AgregarCaracteristica")
		caracteristicaButton.onClick = [| form.modelObject.agregarCaracteristica("caracteristica") ]
		form.addChild(caracteristicaButton)
//		
//		val conexionButton = new XButton("Agregar Conexion")
//		conexionButton.onClick = [| form.modelObject.agregarConexion("conexion")]
//		form.addChild(conexionButton)
//		
//		val lugarButton = new XButton("Agregar Lugar De Interes")
//		lugarButton.onClick = [| form.modelObject.agregarLugarDeInteres("lugarDeInteres")]
//		form.addChild(lugarButton)
//		
//		val guardarPaisButton = new XButton("Aceptar")
//		guardarPaisButton.onClick = [| form.modelObject.agregarPais]
//		form.addChild(guardarPaisButton)
	}

}
