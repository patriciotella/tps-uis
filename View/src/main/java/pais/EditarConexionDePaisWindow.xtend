package pais

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.Selector
import editorDePropiedadDeModelo.EditorDePropiedadDeModeloWindow

class EditarConexionDePaisWindow extends EditorDePropiedadDeModeloWindow<EditorDeConexionesDePais> {

	new(WindowOwner owner, EditorDeConexionesDePais model) {
		super(owner, model)
	}
	
	override protected setWindowTitle() {
		this.setTitle("Editar conexiones")
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
		new Selector(agregarPanel) => [
			width = 230
			bindValueToProperty("conexionNueva")
			bindItemsToProperty("conexiones")
			allowNull = false
		]
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [|this.modelObject.agregarConexion]
			setBackground(Color::lightGray)
		]
	}
	
	override protected eliminarButton(Panel panel) {
		val eliminarButtonPanel = new Panel(panel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [|this.modelObject.borrarConexion]
			setBackground(Color::lightGray)
		]
	}
	
	override protected listaDePropiedades(Panel panel) {
		new Label(panel) => [
			setText("Conexiones")
			setBackground(Color::lightGray)	
		]
		new List(panel) => [
			width = 300
			height = 150
			bindValueToProperty("conexionSeleccionada")
			bindItemsToProperty("pais.conexiones")
		]
	}
	
}