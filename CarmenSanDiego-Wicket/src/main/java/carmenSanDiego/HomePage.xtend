package carmenSanDiego;

import carmenSanDiegoUIs.HomePageModApp
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
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
	EditorDePais editorPais
	
	new() {
		modelApp = new HomePageModApp
		editorVillano = new EditorDeVillano(modelApp.expedientes)
		editorPais = new EditorDePais(modelApp.mapamundi)
		
		val paisForm = new XForm<EditorDePais>("paisForm", new CompoundPropertyModel(editorPais))
		paisForm.outputMarkupId = true
		val editorVillanoform = new XForm<EditorDeVillano>("editorDeVillanoForm",
			new CompoundPropertyModel(editorVillano))
		editorVillanoform.outputMarkupId = true
		
		
		this.addChild(editorVillanoform)
		this.addCrearVillanoButton(editorVillanoform)
		this.addVillanosList(editorVillanoform)
		this.addFieldsVillano(editorVillanoform)
		
		this.addChild(paisForm)
		this.addCrearPaisButton(paisForm)
		this.addPaisesList(paisForm)
		this.addFieldsPais(paisForm)

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

	def crearVillano() {
		responsePage = new EditorDeVillanoPage(modelApp.expedientes, this)
	}
	
	def editarVillano(Villano unVillano){
		responsePage = new EditorDeVillanoPage(unVillano, modelApp.expedientes, this)
	}
	
	def addFieldsPais(XForm<EditorDePais> form) {
		form.addChild(new Label("nombre", new PropertyModel(form.modelObject, "nombre")))
		val conexiones = new XListView("conexiones")
		conexiones.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("conexionSeleccionada", item.model))
		]
		form.addChild(conexiones)
		val caracteristicas = new XListView("caracteristicas")
		caracteristicas.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("caracteristicaSeleccionada", item.model))
		]
		form.addChild(caracteristicas)
		val lugaresDeInteres = new XListView("lugaresDeInteres")
		lugaresDeInteres.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("lugarSeleccionado", item.model))
		]
		form.addChild(lugaresDeInteres)
	}
	
	def addFieldsVillano(XForm<EditorDeVillano> form) {
		form.addChild(new Label("nombre", new PropertyModel(form.modelObject, "nombre")))
		val hobbies = new XListView("hobbies")
		hobbies.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("hobbie", item.model))
		]
		form.addChild(hobbies)
		val seniasParticulares = new XListView("seniasParticulares")
		seniasParticulares.populateItem = [item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("seniaSeleccionada", item.model))
		]
		form.addChild(seniasParticulares)
		form.addChild(new Label("sexo", new PropertyModel(form.modelObject, "sexo")))
	}

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
			item.addChild(
				new XAjaxLink<Object>("inspeccionarPais") => [
					onClick = [ target |
						editorPais.sincWith(item.modelObject, modelApp.mapamundi)
						target.addComponent(form, form.markupId);
					]
				]
			)
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
