package carmenSanDiegoUIs

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
import org.uqbar.arena.bindings.ObservableProperty

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
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [|this.modelObject.borrarLugarDeInteres]
			setBackground(Color::lightGray)
		]

		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		new Selector(agregarPanel) => [
			width = 230
			bindValueToProperty("lugarNuevo")
			owNull = false
			bindItems(new ObservableProperty(this.modelObject, "lugaresPosibles"))
		]
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [|this.modelObject.agregarLugarDeInteres]
			setBackground(Color::lightGray)
			bindEnabledToProperty("puedeAgregarLugar")
			disableOnError
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