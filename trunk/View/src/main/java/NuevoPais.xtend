

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
			setText("Caracteristicas")
			width = 170
		]
		new Button(caracteristicasPanel) => [
			caption = "Editar caracteristicas"
			onClick [ | new EditarCaracteristicasDePaisWindow(this, new EditorDeCaracteristicasDePais(this.modelObject)).open ]
		]


		val caracteristicas = new Panel(mainPanel)
		caracteristicas.layout = new HorizontalLayout
		new Label(caracteristicas) => [
			setText("Caracteristicas")
			width = 340
			setBackground(Color::lightGray)
		]
		new List(mainPanel) => [
			width = 280
			height = 150
			bindItemsToProperty("caracteristicas")
		]
		
		val conexionesPanel = new Panel(mainPanel)
		conexionesPanel.layout = new HorizontalLayout
		new Label(conexionesPanel).setText("Conexiones                             ")
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
			height = 150
			bindItemsToProperty("conexiones")
		]

		val lugaresPanel = new Panel(mainPanel)
		lugaresPanel.layout = new HorizontalLayout
		new Label(lugaresPanel).setText("Lugares de interes")
		new Button(lugaresPanel) => [
			caption = "Editar lugares de interes"
		//			onClick [ | this.modelObject.convertir ]
		]

		var tablaLugares = new Table(mainPanel)
		new Column(tablaLugares).setTitle("Lugares de interes")

		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		var aceptarButton = new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | mapamundi.agregarPais(modelObject) ]
		]
		aceptarButton.setBackground(Color::lightGray)
	}

	def static void main(String[] args) {
		new NuevoPaisWindow(new Mapamundi).startApplication
	}

}