

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.TextBox

class EditarCaracteristicasDePaisWindow extends EditorDePropiedadDeModeloWindow<EditorDeCaracteristicasDePais> {

	new(WindowOwner owner, EditorDeCaracteristicasDePais model) {
		super(owner, model)
	}
	
	override protected setWindowTitle() {
		this.setTitle("Editar caracteristicas")
	}
	
	override protected aceptarButton(Panel panel) {
		val buttonPanel = new Panel(panel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
			setBackground(Color::lightGray)
		]
	}
	
	override protected agregarPropiedadInput(Panel panel) {
		val agregarPanel = new Panel(panel)
		agregarPanel.layout = new HorizontalLayout
		val caracteristica = new TextBox(agregarPanel).width = 230
		caracteristica.bindValueToProperty("caracteristicaNueva")

		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarCaracteristica ]
			setBackground(Color::lightGray)
		]
	}
	
	override protected eliminarButton(Panel panel) {
		val eliminarButtonPanel = new Panel(panel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarCaracteristica ]
			setBackground(Color::lightGray)
		]
	}
	
	override protected listaDePropiedades(Panel panel) {
		new Label(panel)=> [
			setText("Caracteristicas")
			setBackground(Color::lightGray)
		]
		new List(panel) => [
			width = 300
			height = 150
			bindValueToProperty("caracteristicaSeleccionada")
			bindItemsToProperty("pais.caracteristicas")
		]
	}

}