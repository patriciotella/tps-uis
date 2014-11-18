package carmenSanDiego

import org.apache.wicket.markup.html.WebPage
import mapamundi.Mapamundi
import pais.Pais
import pais.EditorDePais
import org.uqbar.wicket.xtend.XForm
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.PropertyModel
import lugarDeInteres.LugarDeInteres
import org.apache.wicket.markup.html.panel.FeedbackPanel

class EditorDePaisPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	HomePage mainPage
	Mapamundi mapamundi

	new(Mapamundi unMapamundi, HomePage page) {
		mainPage = page
		mapamundi = unMapamundi
		val paisForm = new XForm<EditorDePais>("editorDePaisForm",
			new CompoundPropertyModel(new EditorDePais(mapamundi)))
		this.addChild(paisForm)
		this.addActions(paisForm)
		this.addFields(paisForm)
	}

	new(Mapamundi unMapamundi, Pais unPais, HomePage page) {
		mainPage = page
		mapamundi = unMapamundi
		val paisForm = new XForm<EditorDePais>("editorDePaisForm",
			new CompoundPropertyModel(new EditorDePais(unMapamundi, unPais)))
		this.addChild(paisForm)
		this.addActions(paisForm)
		this.addFields(paisForm)
	}

	def addFields(XForm<EditorDePais> form) {
		form.addChild(nombrePais(form))

		form.addChild(
			new DropDownChoice<String>("caracteristicaSeleccionada") => [
				choices = new PropertyModel(form.modelObject, "caracteristicas")
				choiceRenderer = choiceRenderer([h|h])
			])
		form.addChild(agregarCaracteristicasField(form))

		form.addChild(
			new DropDownChoice<Pais>("conexionSeleccionada") => [
				choices = new PropertyModel(form.modelObject, "conexiones")
				choiceRenderer = choiceRenderer([getNombre(it)])
			])
		form.addChild(
			new DropDownChoice<Pais>("conexionNueva") => [
				choices = new PropertyModel(form.modelObject, "conexionesParaAgregar")
				choiceRenderer = choiceRenderer([getNombre(it)])
			])

		form.addChild(
			new DropDownChoice<LugarDeInteres>("lugarSeleccionado") => [
				choices = new PropertyModel(form.modelObject, "lugaresDeInteres")
				choiceRenderer = choiceRenderer([getNombreDeLugar(it)])
			])
		form.addChild(
			new DropDownChoice<LugarDeInteres>("lugarDeInteresNuevo") => [
				choices = new PropertyModel(form.modelObject, "lugaresPosibles")
				choiceRenderer = choiceRenderer([getNombreDeLugar(it)])
			])
		form.addChild(new FeedbackPanel("feedbackPanel"))
	}

	def getNombreDeLugar(LugarDeInteres lugarDeInteres) {
		lugarDeInteres.getNombre
	}

	def getNombre(Pais pais) {
		pais.nombreDePais
	}

	def agregarCaracteristicasField(XForm<EditorDePais> form) {
		new TextField<String>("caracteristicaNueva")
	}

	def nombrePais(XForm<EditorDePais> form) {
		new TextField<String>("nombre")
	}

	def addActions(XForm<EditorDePais> form) {
		form.addChild(
			new XButton("cancelar") => [
				onClick = [|volver]
				defaultFormProcessing = false
			])
		form.addChild(new XButton("crearPais").onClick = [|crearPais(form.modelObject)])
		form.addChild(
			new XButton("agregarCaracteristica").onClick = [|
				form.modelObject.agregarCaracteristica(form.modelObject.caracteristicaNueva)])
		form.addChild(
			new XButton("eliminarCaracteristica").onClick = [|
				form.modelObject.borrarCaracteristica(form.modelObject.caracteristicaSeleccionada)])
		form.addChild(
			new XButton("agregarConexion").onClick = [|form.modelObject.agregarConexion(form.modelObject.conexionNueva)])
		form.addChild(
			new XButton("eliminarConexion").onClick = [|
				form.modelObject.borrarConexion(form.modelObject.conexionSeleccionada)])
		form.addChild(
			new XButton("agregarLugar").onClick = [|
				form.modelObject.agregarLugarDeInteres(form.modelObject.lugarDeInteresNuevo)])
		form.addChild(
			new XButton("eliminarLugar").onClick = [|
				form.modelObject.borrarLugarDeInteres(form.modelObject.lugarSeleccionado)])
	}

	def crearPais(EditorDePais editor) {
		try{
			editor.agregarPais
			volver
		}catch (RuntimeException e){
			error("El país debe tener nombre, al menos una característica y exactamente 3 lugares de interés.")
		}
	}

	def volver() {
		responsePage = mainPage
	}

}
