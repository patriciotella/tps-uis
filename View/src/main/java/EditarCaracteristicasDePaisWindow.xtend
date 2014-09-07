

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.TextBox

class EditarCaracteristicasDePaisWindow extends Dialog<EditorDeCaracteristicasDePais> {

	new(WindowOwner owner, EditorDeCaracteristicasDePais model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		this.setTitle("Editar caracteristicas")

		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel)=> [
			setText("Caracteristicas")
			setBackground(Color::lightGray)
		]
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("caracteristicaSeleccionada")
			bindItemsToProperty("pais.caracteristicas")
		]

		val eliminarButtonPanel = new Panel(mainPanel)
		eliminarButtonPanel.layout = new HorizontalLayout
		var eliminarButton = new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarCaracteristica ]
		]
		eliminarButton.setBackground(Color::lightGray)

		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		val caracteristica = new TextBox(agregarPanel).width = 230
		caracteristica.bindValueToProperty("caracteristicaNueva")

		var agregarButton = new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarCaracteristica ]
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