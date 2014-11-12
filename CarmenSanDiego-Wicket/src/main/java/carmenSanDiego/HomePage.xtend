package carmenSanDiego;

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XForm
import org.apache.wicket.markup.html.form.DropDownChoice
import villano.EditorDeVillano
import carmenSanDiegoUIs.HomePageModApp
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.model.PropertyModel

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
		form.addChild(new XButton("crearVillano").onClick = [| crearVillano])
		val agregarHobbieButton = new XButton("agregarHobbie").onClick = [| form.modelObject.agregarHobbie(form.modelObject.hobbieNuevo)]
		form.addChild(agregarHobbieButton)
		form.addChild(new XButton("eliminarHobbie").onClick = [|form.modelObject.eliminarHobbie("hobbieSeleccionado")])
		form.addChild(new XButton("agregarSeniaParticular").onClick = [| 
			form.modelObject.agregarSeniaParticular(form.modelObject.seniaNueva)
		])
		form.addChild(new XButton("eliminarSeniaParticular").onClick = [| form.modelObject.eliminarSeniaParticular("seniaSeleccionada")])
	}

	def addFieldsVillano(XForm<EditorDeVillano> form) {

		form.addChild(nombreVillanoTextField(form))
		form.addChild(
			new DropDownChoice<String>("hobbieSeleccionado") => [
				choices = new PropertyModel(form.modelObject, "hobbies")
				choiceRenderer = choiceRenderer([h|h])
			])
		form.addChild(agregarHobbieTextField(form))
		form.addChild(
			new DropDownChoice<String>("sexo") => [
          		choices = new PropertyModel(form.modelObject, "sexos")				
				choiceRenderer = choiceRenderer([s|s])
			])
		form.addChild(agregarSeniasTextField(form))
		form.addChild(
			new DropDownChoice<String>("seniaSeleccionada") => [
				choices = new PropertyModel(form.modelObject, "seniasParticulares")
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
	
	def agregarSeniasTextField(Form<EditorDeVillano> form) {
		
		return new TextField<String>("seniaNueva")
	}

	def crearVillano(){
		responsePage = new CrearVillanoPage(modelApp.expedientes, this) 
	}
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
