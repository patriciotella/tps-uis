package carmenSanDiegoUIs

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
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarCaracteristica ]
			setBackground(Color::lightGray)
		]

		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		val caracteristica = new TextBox(agregarPanel).width = 230
		caracteristica.bindValueToProperty("caracteristicaNueva")

		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarCaracteristica ]
			setBackground(Color::lightGray)
		]

		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
			setBackground(Color::lightGray)
		]
	}

}