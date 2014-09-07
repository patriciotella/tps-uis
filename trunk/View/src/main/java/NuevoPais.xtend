

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import java.awt.Color
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

class NuevoPaisWindow extends MainWindow<Pais> {

	Mapamundi mapamundi
	
	new(Mapamundi mapamundi) {
		super(new Pais)
		this.mapamundi = mapamundi
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi - Nuevo Pais")
		val editorPanel = new Panel(mainPanel)
		mainPanel.setLayout(new VerticalLayout)

		val nombrePanel = new Panel(editorPanel)
		nombrePanel.layout = new HorizontalLayout
		new Label(nombrePanel).setText("Nombre:")
		new TextBox(nombrePanel) => [
			bindValueToProperty("nombre") 
			width = 150
		]

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
		
		val conexionesPanel = new Panel(mainPanel)
		conexionesPanel.layout = new HorizontalLayout
		new Label(conexionesPanel) => [
			setText("Conexiones")
			width = 200
		]
		new Button(conexionesPanel) => [
			caption = "Editar conexiones"
			onClick [ | new EditarConexionDePaisWindow(this, new EditorDeConexionesDePais(modelObject, mapamundi)).open ]
		]

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

		val lugaresPanel = new Panel(mainPanel)
		lugaresPanel.layout = new HorizontalLayout
		new Label(lugaresPanel) => [
			setText("Lugares de interés")
			width = 160	
		]
		new Button(lugaresPanel) => [
			caption = "Editar lugares de interés"
			onClick [ | new EditarLugaresDeInteresWindow(this, new EditorDeLugaresDeInteres()).open ]
		]


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
//			bindItemsToProperty("conexiones")
		]
		//var tablaLugares = new Table(mainPanel)
		//new Column(tablaLugares).setTitle("Lugares de interes")

		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		var aceptarButton = new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | mapamundi.agregarPais(modelObject) 
						close
					]
		]
		aceptarButton.setBackground(Color::lightGray)
	}

	def static void main(String[] args) {
		new NuevoPaisWindow(new Mapamundi).startApplication
	}

}