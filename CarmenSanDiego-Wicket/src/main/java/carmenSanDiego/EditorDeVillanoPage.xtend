package carmenSanDiego

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import villano.Expedientes
import villano.EditorDeVillano
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.XForm
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.PropertyModel
import villano.Villano
import org.apache.wicket.markup.html.panel.FeedbackPanel

class EditorDeVillanoPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	private final HomePage mainPage
	private final Expedientes expedientes
	
	new(Expedientes expedientes, HomePage mainPage) {
		this.mainPage = mainPage
		this.expedientes = expedientes
		val crearVillanoform = new XForm<EditorDeVillano>("crearVillanoForm",
			new CompoundPropertyModel(new EditorDeVillano(expedientes)))
		this.addChild(crearVillanoform)
		this.addActions(crearVillanoform)
		this.addFields(crearVillanoform)
	}
	
	new(Villano unVillano, Expedientes expedientes, HomePage mainPage){
		this.mainPage = mainPage
		this.expedientes = expedientes
		val crearVillanoform = new XForm<EditorDeVillano>("crearVillanoForm",
			new CompoundPropertyModel(new EditorDeVillano(unVillano,expedientes)))
		this.addChild(crearVillanoform)
		this.addActions(crearVillanoform)
		this.addFields(crearVillanoform)		
	}
	
	def addActions(XForm<EditorDeVillano> form) {
		form.addChild(new XButton("cancelar") => [
			onClick = [| volver]
			defaultFormProcessing = false
		])
		form.addChild(new XButton("crearVillano").onClick = [| 
			try{
				crearVillano(form.modelObject)
			} catch (RuntimeException e){
				error("El villano debe tener nombre y, al menos, 2 señas particulares y un hobbie.")
			}
		])
		form.addChild(new XButton("agregarHobbie").onClick = [|
			if(form.modelObject.hobbieNuevo == null)
				error("Debe ingresar un hobbie para agregar")
			else
				form.modelObject.agregarHobbie(form.modelObject.hobbieNuevo)
		])
		form.addChild(new XButton("eliminarHobbie").onClick = [|
			if(form.modelObject.hobbieSeleccionado == null)
				error("Debe seleccionar un hobbie para eliminar")
			else
				form.modelObject.eliminarHobbie(form.modelObject.hobbieSeleccionado)
		])
		form.addChild(new XButton("agregarSeniaParticular").onClick = [|
			if(form.modelObject.seniaNueva == null)
				error("Debe ingresar una seña para agregar")
			else
				form.modelObject.agregarSeniaParticular(form.modelObject.seniaNueva)
		])
		form.addChild(new XButton("eliminarSeniaParticular").onClick = [|
			if(form.modelObject.seniaSeleccionada == null)
				error("Debe seleccionar una seña para borrar")
			else
				form.modelObject.eliminarSeniaParticular(form.modelObject.seniaSeleccionada)
		])
	}

	def addFields(XForm<EditorDeVillano> form) {
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
		form.addChild(new FeedbackPanel("feedbackPanel"))
	}

	def nombreVillanoTextField(XForm<EditorDeVillano> form) {
		val a = new TextField<String>("nombre")
		return a
	}

	def agregarHobbieTextField(XForm<EditorDeVillano> form) {
		return new TextField<String>("hobbieNuevo")
	}
	
	def agregarSexoTextField(XForm<EditorDeVillano> form) {
		return new TextField<String>("sexo")
	}
	
	def agregarSeniasTextField(XForm<EditorDeVillano> form) {
		return new TextField<String>("seniaNueva")
	}
	
	def crearVillano(EditorDeVillano unEditor) {
		unEditor.agregarVillano
		responsePage = mainPage
	}
	
	def volver() {
		responsePage = mainPage
	}
}