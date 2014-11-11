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
import villano.EditorDeVillano
import villano.Expedientes
import carmenSanDiegoUIs.HomePageModApp
import org.uqbar.wicket.xtend.XListView
import villano.Villano

/**
 * Homepage
 */
public class HomePage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	HomePageModApp modelApp

	new() {
		modelApp = new HomePageModApp
		val editorVillanoform = new XForm<EditorDeVillano>("editorDeVillanoForm",
			new CompoundPropertyModel(new EditorDeVillano(modelApp.expedientes)))

		//		val editorPaisform = new XForm<EditorDePais>("EditorDePaisForm", new CompoundPropertyModel(new EditorDePais(modelApp.mapamundi)))	
		this.add(new XListView("modelApp.expedientes.villanos"))

		this.addChild(editorVillanoform)
		this.addFieldsVillano(editorVillanoform)
		this.addActionsVillano(editorVillanoform)

//		this.add(new XListView("modelApp.mapamundi.paises"))
//		this.addChild(editorPaisform)
//		this.addFieldsPais(editorPaisform)
//		this.addActionsPais(editorPaisform)
	}

	
	def addActionsVillano(XForm<EditorDeVillano> form) {
//		form.addChild(new XButton("EditarVillano").onClick = [| editarVillano() ])
		form.addChild(new XButton("AgregarHobbie").onClick = [| form.modelObject.agregarHobbie("hobbieNuevo")])
		form.addChild(new XButton("EliminarHobbie").onClick = [|form.modelObject.eliminarHobbie("hobbieSeleccionado")])
		form.addChild(new XButton("AgregarSeniaParticular").onClick = [| form.modelObject.agregarSeniaParticular("seniaNueva")])
		form.addChild(new XButton("EliminarSeniaParticular").onClick = [| form.modelObject.eliminarSeniaParticular("seniaSeleccionada")])
	}
//	
//	def editarVillano () {
//		responsePage = new EditorDeVillanoPage(this) 
//	}

	def addFieldsVillano(XForm<EditorDeVillano> form) {

		form.addChild(nombreVillanoTextField(form))
		form.addChild(
			new DropDownChoice<String>("hobbies") => [
				choices = loadableModel([|form.modelObject.hobbies.toList])
				choiceRenderer = choiceRenderer([h|h])
			])
		form.addChild(agregarHobbieTextField(form))
		form.addChild(agregarSexoTextField(form))
		form.addChild(agregarSeniasTextField(form))
		form.addChild(
			new DropDownChoice<String>("seniasParticulares") => [
				choices = loadableModel([|form.modelObject.seniasParticulares.toList])
				choiceRenderer = choiceRenderer([s|s])
			])

//		form.addChild(new FeedbackPanel("feedbackPanel")) //ESTE ES EL QUE MUESTRA ERRORES
	}

	def nombreVillanoTextField(Form<EditorDeVillano> form) {

		val a = new TextField<String>("nombre")
		return a
	}

	def agregarHobbieTextField(Form<EditorDeVillano> form) {

		return new TextField<String>("hobbieNuevo")
	}
	
	def agregarSexoTextField(Form<EditorDeVillano> form) {
		
		return new TextField<String>("sexo")
	}
	
	def agregarSeniasTextField(Form<EditorDeVillano> form) {
		
		return new TextField<String>("seniaNueva")
	}


//		VER LISTAS EN EJEMPLO DE CELULARES PARA LISTA DE CONEXIONES
	//		form.addChild(crearConexionPaisTextField(form))
	//		VER LISTAS EN EJEMPLO DE CELULARES PARA LISTA DE LUGAR DE INTERES
	//		form.addChild(crearLugarDeInteresPaisTextField(form))
	//	
//	def addActionsPais(XForm<EditorDePais> form) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
//
//	def addFieldsPais(XForm<EditorDePais> form) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
//
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
}
