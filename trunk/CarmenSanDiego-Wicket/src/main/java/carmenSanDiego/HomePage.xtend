package carmenSanDiego;

import carmenSanDiegoUIs.HomePageModApp
import org.apache.wicket.Component
import org.apache.wicket.ajax.AjaxRequestTarget
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.apache.wicket.model.PropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XAjaxLink
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XForm
import org.uqbar.wicket.xtend.XListView
import pais.Pais
import villano.EditorDeVillano
import villano.Villano
import pais.EditorDePais

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
		val paisForm = new XForm<EditorDePais>("paisForm", new CompoundPropertyModel(modelApp))
		paisForm.outputMarkupId = true

		editorVillanoform = new XForm<EditorDeVillano>("editorDeVillanoForm",
			new CompoundPropertyModel(editorVillano))
		
		
		this.addChild(editorVillanoform)
		this.addCrearVillanoButton(editorVillanoform)
		this.addVillanosList(editorVillanoform)
		this.addFieldsVillano(editorVillanoform)
		this.addActionsVillano(editorVillanoform)
		editorVillanoform.outputMarkupId = true
		
		//		val editorPaisform = new XForm<EditorDePais>("EditorDePaisForm", new CompoundPropertyModel(new EditorDePais(modelApp.mapamundi)))	
		//		this.add(new XListView("modelApp.expedientes.villanos"))
		this.addChild(paisForm)
		this.addCrearPaisButton(paisForm)
		this.addPaisesList(paisForm)


	//		this.add(new XListView("modelApp.mapamundi.paises"))
	//		this.addChild(editorPaisform)
	//		this.addFieldsPais(editorPaisform)
	//		this.addActionsPais(editorPaisform)
	}
	
	def addCrearPaisButton(XForm<EditorDePais> form) {
		form.addChild(new XButton("crearPais").onClick = [|crearPais])
	}
	
	def addCrearVillanoButton(XForm<EditorDeVillano> form){
		form.addChild(new XButton("crearVillano").onClick = [|crearVillano])
	}
	def crearPais() {
		responsePage = new EditorDePaisPage(modelApp.mapamundi, this)
	}
	
	def editarPais(Pais unPais){
		responsePage = new EditorDePaisPage(modelApp.mapamundi, unPais, this)
	}

	def addActionsVillano(XForm<EditorDeVillano> form) {
	}

	def addFieldsVillano(XForm<EditorDeVillano> form) {
		form.addChild(new Label("nombre", new PropertyModel(form.modelObject, "nombre")))
		val hobbies = new XListView("hobbies")
		hobbies.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("hobbie", item.model))
		]
		form.addChild(hobbies)
//			new DropDownChoice<String>("hobbieSeleccionado") => [
//				choices = new PropertyModel(form.modelObject, "hobbies")
//				choiceRenderer = choiceRenderer([h|h])
//			])
		form.addChild(
			new DropDownChoice<String>("seniaSeleccionada") => [
				choices = new PropertyModel(form.modelObject, "seniasParticulares")
				choiceRenderer = choiceRenderer([s|s])
			])
		form.addChild(new Label("sexo", new PropertyModel(form.modelObject, "sexo")))
	//		form.addChild(new FeedbackPanel("feedbackPanel")) //ESTE ES EL QUE MUESTRA ERRORES
		form.addChild(new XButton("volver"))
	}

	def nombreVillanoTextField(Form<EditorDeVillano> form) {
		new Label("nombre")
	}
	
	def sexoTextField(Form<EditorDeVillano> form) {
		new Label("sexo")
	}
	
	def crearVillano() {
		responsePage = new EditorDeVillanoPage(modelApp.expedientes, this)
	}
	
	def editarVillano(Villano unVillano){
		responsePage = new EditorDeVillanoPage(unVillano, modelApp.expedientes, this)
	}

//	def addLists(Form<EditorDePais> parent) {
//		addVillanosList(parent)
//		addPaisesList(parent)
//	}
	
	def addPaisesList(Form<EditorDePais> form) {
		val paises = new XListView("paises", modelApp.mapamundi.paises)
		paises.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombreDePais"))
			item.addChild(
				new XAjaxLink<Object>("eliminarPais") => [
					onClick = [ target |
						modelApp.mapamundi.eliminarPais(item.modelObject)
						target.addComponent(form, form.markupId);
					]
				]
			)
			item.addChild(new XButton("editar").onClick = [ |
				editarPais(item.modelObject)
			])
		]
		form.addChild(paises)
	}
	
	def addVillanosList(Form<EditorDeVillano> parent) {
		val listView = new XListView("expedientes.villanos")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(
				new XAjaxLink<Object>("eliminar") => [
					onClick = [ target |
						modelApp.expedientes.eliminarVillano(item.modelObject)
						target.addComponent(parent, parent.markupId);
					]
				]
			)
			item.addChild(new XButton("editar").onClick = [ |
				editarVillano(item.modelObject)
			])
			item.addChild(
				new XAjaxLink<Object>("inspeccionarVillano") => [
					onClick = [ target |
						editorVillano.sincWith(item.modelObject, modelApp.expedientes)
						target.addComponent(parent, parent.markupId);
					]
				]
			)
		]
		parent.addChild(listView)
	}
}
