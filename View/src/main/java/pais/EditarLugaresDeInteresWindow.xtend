package pais

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.ObservableProperty
import editorDePropiedadDeModelo.EditorDePropiedadDeModeloWindow

class EditarLugaresDeInteresWindow extends EditorDePropiedadDeModeloWindow<EditorDeLugaresDeInteres> {
	
	new(WindowOwner owner, EditorDeLugaresDeInteres model) {
		super(owner, model)
	}
	
	override protected setWindowTitle() {
		this.setTitle("Editar lugares de interés")
	}
	
	override protected aceptarButton(Panel panel) {
		val buttonPanel = new Panel(panel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|
//				modelObject.aceptar 
				close
			]
			setBackground(Color::lightGray)
		]
	}
	
	override protected agregarPropiedadInput(Panel panel) {
		val agregarPanel = new Panel(panel)
		agregarPanel.layout = new HorizontalLayout
		new Selector(agregarPanel) => [
			width = 230
			bindValueToProperty("lugarNuevo")
			allowNull = false
			bindItems(new ObservableProperty(this.modelObject, "lugaresPosibles"))
		]
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [|this.modelObject.agregarLugarDeInteres]
			setBackground(Color::lightGray)
			bindEnabledToProperty("puedeAgregarLugar")
//			bindEnabledToProperty("seleccionoLugarParaAgregar")
			disableOnError
		]
	}
	
	override protected eliminarButton(Panel panel) {
		val eliminarButtonPanel = new Panel(panel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [|this.modelObject.borrarLugarDeInteres]
			setBackground(Color::lightGray)
			bindEnabledToProperty("seleccionoLugarABorrar")
		]
	}
	
	override protected listaDePropiedades(Panel panel) {
		new Label(panel) => [
			setText("Lugares de interés")
			setBackground(Color::lightGray)	
		]
		new List(panel) => [
			width = 300
			height = 150
			bindValueToProperty("lugarSeleccionado")
			bindItemsToProperty("lugaresDeInteres")
		]
	}
	
}