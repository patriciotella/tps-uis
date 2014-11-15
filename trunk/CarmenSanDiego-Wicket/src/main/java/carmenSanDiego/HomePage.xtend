package carmenSanDiego;

import carmenSanDiegoUIs.HomePageModApp
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.apache.wicket.model.PropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XForm
import org.uqbar.wicket.xtend.XListView
import villano.EditorDeVillano
import org.uqbar.wicket.xtend.XAjaxLink

/**
 * Homepage
 */
public class HomePage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	HomePageModApp modelApp
	EditorDeVillano editorVillano
	
	XForm<EditorDeVillano> editorVillanoform

	new() {
		modelApp = new HomePageModApp
		editorVillano = new EditorDeVillano(modelApp.expedientes)
		val modelApp = new XForm<HomePageModApp>("modelApp", new CompoundPropertyModel(modelApp))

		editorVillanoform = new XForm<EditorDeVillano>("editorDeVillanoForm",
			new CompoundPropertyModel(editorVillano))
		
		
		this.addChild(editorVillanoform)
		this.addFieldsVillano(editorVillanoform)
		this.addActionsVillano(editorVillanoform)
		editorVillanoform.outputMarkupId = true
		
		//		val editorPaisform = new XForm<EditorDePais>("EditorDePaisForm", new CompoundPropertyModel(new EditorDePais(modelApp.mapamundi)))	
		//		this.add(new XListView("modelApp.expedientes.villanos"))
		this.addChild(modelApp)
		this.addCrearButtons(modelApp)
		this.addLists(modelApp)


	//		this.add(new XListView("modelApp.mapamundi.paises"))
	//		this.addChild(editorPaisform)
	//		this.addFieldsPais(editorPaisform)
	//		this.addActionsPais(editorPaisform)
	}
	
	def addCrearButtons(XForm<HomePageModApp> form) {
		form.addChild(new XButton("crearVillano").onClick = [|crearVillano])
		form.addChild(new XButton("crearPais").onClick = [|crearPais])
	}
	
	def crearPais() {
		responsePage = new EditorDePaisPage(modelApp.mapamundi, this)
	}

	def addActionsVillano(XForm<EditorDeVillano> form) {
		val agregarHobbieButton = new XButton("agregarHobbie").onClick = [|
			form.modelObject.agregarHobbie(form.modelObject.hobbieNuevo)]
		form.addChild(agregarHobbieButton)
		form.addChild(
			new XButton("eliminarHobbie").onClick = [|
				form.modelObject.eliminarHobbie(form.modelObject.hobbieSeleccionado)])
		form.addChild(
			new XButton("agregarSeniaParticular").onClick = [ |
				form.modelObject.agregarSeniaParticular(form.modelObject.seniaNueva)
			])
		form.addChild(
			new XButton("eliminarSeniaParticular").onClick = [|
				form.modelObject.eliminarSeniaParticular(form.modelObject.seniaSeleccionada)])
		form.addChild(new XButton("submitCambios").onClick = [|form.modelObject.agregarVillano])
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
		return new TextField<String>("nombre")
	}

	def agregarHobbieTextField(Form<EditorDeVillano> form) {
		return new TextField<String>("hobbieNuevo")
	}

	def agregarSeniasTextField(Form<EditorDeVillano> form) {
		return new TextField<String>("seniaNueva")
	}

	def crearVillano() {
		responsePage = new CrearVillanoPage(modelApp.expedientes, this)
	}

	def addLists(Form<HomePageModApp> parent) {
		addVillanosList(parent)
		addPaisesList(parent)
	}
	
	def addPaisesList(Form<HomePageModApp> form) {
		val paises = new XListView("paises", modelApp.mapamundi.paises)
		paises.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombreDePais"))
			item.addChild(
				new XButton("eliminarPais").onClick = [ |
					form.modelObject.mapamundi.eliminarPais(item.modelObject)
				]
			)
		]
		form.addChild(paises)
	}
	
	def addVillanosList(Form<HomePageModApp> parent) {
		val listView = new XListView("expedientes.villanos")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
//			item.addChild(
//				new XAjaxLink<Object>("editar") => [
//					onClick = [ target |
//						editorVillano.sincWith(item.modelObject, parent.modelObject.expedientes)
//						target.add(editorVillanoform)
//					]
//				]
//			)
			item.addChild(
				new XButton("eliminar").onClick = [ |
					parent.modelObject.expedientes.eliminarVillano(item.modelObject)
				]
			)
		]
		parent.addChild(listView)
	}
}
