package pais

import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PaisWindow extends SimpleWindow<EditorDePais> {

	new(WindowOwner owner, EditorDePais model) {
		super(owner, model)
	}

	override createFormPanel(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		agregarNombreInput(mainPanel)
		agregarCaracteristicasYSuEditor(mainPanel)
		agregarConexionesYSuEditor(mainPanel)
		agregarLugaresDeInteresYSuEditor(mainPanel)
		agregarAceptarBoton(mainPanel)
	}
	
	private def agregarLugaresDeInteresYSuEditor(Panel mainPanel) {
		agregarEditorDeLugaresDeInteres(mainPanel)
		listaDeLugaresDeInteres(mainPanel)
	}
	
	private def agregarConexionesYSuEditor(Panel mainPanel) {
		agregarEditorDeConexiones(mainPanel)
		listaDeConexiones(mainPanel)
	}
	
	private def agregarCaracteristicasYSuEditor(Panel mainPanel) {
		agregarEditorDeCaracteristicas(mainPanel)
		listaDeCaracteristicas(mainPanel)
	}
	
	private def agregarAceptarBoton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | modelObject.agregarPais() 
						close
			]
			setBackground(Color::lightGray)
		]
	}
	
	private def listaDeLugaresDeInteres(Panel mainPanel) {
		val lugares = new Panel(mainPanel)
		lugares.layout = new HorizontalLayout
		new Label(lugares) => [
			setText("Lugares de interés")
			width = 340
			setBackground(Color::lightGray)
		]
		new List(mainPanel) => [
			width = 280
			height = 120
			bindItemsToProperty("lugaresDeInteres")
		]
	}
	
	private def agregarEditorDeLugaresDeInteres(Panel mainPanel) {
		val lugaresPanel = new Panel(mainPanel)
		lugaresPanel.layout = new HorizontalLayout
		new Label(lugaresPanel) => [
			setText("Lugares de interés")
			width = 160	
		]
		new Button(lugaresPanel) => [
			caption = "Editar lugares de interés"
			onClick [ | new EditarLugaresDeInteresWindow(this, new EditorDeLugaresDeInteres(this.modelObject)).open ]
		]
	}
	
	private def listaDeConexiones(Panel mainPanel) {
		val conexiones = new Panel(mainPanel)
		conexiones.layout = new HorizontalLayout
		new Label(conexiones) => [
			setText("Conexiones")
			width = 340
			setBackground(Color::lightGray)
		]
		new List(mainPanel) => [
			width = 280
			height = 120
			bindItemsToProperty("conexiones")
		]
	}
	
	private def agregarEditorDeConexiones(Panel mainPanel) {
		val conexionesPanel = new Panel(mainPanel)
		conexionesPanel.layout = new HorizontalLayout
		new Label(conexionesPanel) => [
			setText("Conexiones")
			width = 200
		]
		new Button(conexionesPanel) => [
			caption = "Editar conexiones"
			onClick [ | new EditarConexionDePaisWindow(this, new EditorDeConexionesDePais(modelObject, modelObject.mapamundi)).open ]
		]
	}
	
	private def listaDeCaracteristicas(Panel mainPanel) {
		val caracteristicas = new Panel(mainPanel)
		caracteristicas.layout = new HorizontalLayout
		new Label(caracteristicas) => [
			setText("Características")
			width = 340
			setBackground(Color::lightGray)
		]
		new List(mainPanel) => [
			width = 280
			height = 120
			bindItemsToProperty("caracteristicas")
		]
	}
	
	private def agregarEditorDeCaracteristicas(Panel editorPanel) {
		val caracteristicasPanel = new Panel(editorPanel)
		caracteristicasPanel.layout = new HorizontalLayout
		new Label(caracteristicasPanel) => [
			setText("Características")
			width = 175
		]
		new Button(caracteristicasPanel) => [
			caption = "Editar características"
			onClick [ | new EditarCaracteristicasDePaisWindow(this, new EditorDeCaracteristicasDePais(this.modelObject)).open ]
		]
	}
	
	private def agregarNombreInput(Panel editorPanel) {
		val nombrePanel = new Panel(editorPanel)
		nombrePanel.layout = new HorizontalLayout
		new Label(nombrePanel).setText("Nombre:")
		new TextBox(nombrePanel) => [
			bindValueToProperty("nombre") 
			width = 150
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	}

}