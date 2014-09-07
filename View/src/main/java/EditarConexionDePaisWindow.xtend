

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.Selector

class EditarConexionDePaisWindow extends Dialog<EditorDeConexionesDePais> {

	new(WindowOwner owner, EditorDeConexionesDePais model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		this.setTitle("Editar conexiones")

		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel) => [
			setText("Conexiones")
			setBackground(Color::lightGray)	
		]
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("conexionSeleccionada")
			bindItemsToProperty("pais.conexiones")
		]

		val eliminarButtonPanel = new Panel(mainPanel)
		eliminarButtonPanel.layout = new HorizontalLayout
		var eliminarButton = new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [|this.modelObject.borrarConexion]
		]
		eliminarButton.setBackground(Color::lightGray)

		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		new Selector(agregarPanel) => [
			width = 230
			bindValueToProperty("conexionNueva")
			bindItemsToProperty("mapamundi.paises")
//			allowNull = false
//			bindItems(new ObservableProperty(this.modelObject, "paises"))
//			bindValueToProperty("conexionNueva")
		]
		
		var agregarButton = new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [|this.modelObject.agregarConexion]
		]
		agregarButton.setBackground(Color::lightGray)

		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		var aceptarButton = new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
		]
		aceptarButton.setBackground(Color::lightGray)
	}
	
}