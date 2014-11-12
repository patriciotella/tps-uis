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

class CrearVillanoPage extends WebPage {
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
	
	def addActions(XForm<EditorDeVillano> form) {
		form.addChild(new XButton("cancelar").onClick = [| volver])
		form.addChild(new XButton("crearVillano").onClick = [| crearVillano(form.modelObject)])
		form.addChild(new XButton("agregarHobbie").onClick = [| form.modelObject.agregarHobbie("hobbieNuevo")])
		form.addChild(new XButton("eliminarHobbie").onClick = [|form.modelObject.eliminarHobbie("hobbieSeleccionado")])
		form.addChild(new XButton("agregarSeniaParticular").onClick = [| form.modelObject.agregarSeniaParticular("seniaNueva")])
		form.addChild(new XButton("eliminarSeniaParticular").onClick = [| form.modelObject.eliminarSeniaParticular("seniaSeleccionada")])
	}

	def addFields(XForm<EditorDeVillano> form) {

		form.addChild(nombreVillanoTextField(form))
		form.addChild(
			new DropDownChoice<String>("hobbies") => [
				choices = loadableModel([|form.modelObject.hobbies.toList])
				choiceRenderer = choiceRenderer([h|h])
			])
		form.addChild(agregarHobbieTextField(form))
		form.addChild(
			new DropDownChoice<String>("sexos") => [
				choices = loadableModel([|form.modelObject.sexos])
				choiceRenderer = choiceRenderer([s|s])
			])
		form.addChild(agregarSeniasTextField(form))
		form.addChild(
			new DropDownChoice<String>("seniasParticulares") => [
				choices = loadableModel([|form.modelObject.seniasParticulares.toList])
				choiceRenderer = choiceRenderer([s|s])
			])

//		form.addChild(new FeedbackPanel("feedbackPanel")) //ESTE ES EL QUE MUESTRA ERRORES
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