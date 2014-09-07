

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class EditarLugaresDeInteresWindow extends Dialog<EditorDeLugaresDeInteres> {
	
	new(WindowOwner owner, EditorDeLugaresDeInteres model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		this.setTitle("Editar lugares de interés")

		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel) => [
			setText("Lugares de interés")
			setBackground(Color::lightGray)	
		]
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("lugarSeleccionado")
			bindItemsToProperty("pais.lugaresDeInteres")
		]

		val eliminarButtonPanel = new Panel(mainPanel)
		eliminarButtonPanel.layout = new HorizontalLayout
		var eliminarButton = new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [|this.modelObject.borrarLugarDeInteres]
		]
		eliminarButton.setBackground(Color::lightGray)

		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		new Selector(agregarPanel) => [
			width = 230
			bindValueToProperty("lugarNuevo")
			allowNull = false
//			bindItems(new ObservableProperty(this.modelObject, "paises"))
//			bindValueToProperty("conexionNueva")
		]
		
		var agregarButton = new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [|this.modelObject.agregarLugarDeInteres]
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