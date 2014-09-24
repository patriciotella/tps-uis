package villano

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox

class EditarSeniasParticularesDeVillanoWindow extends Dialog<EditorDeSeniasParticularesDeVillano> {
	
	new(WindowOwner owner, EditorDeSeniasParticularesDeVillano model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setWindowTitle()
		mainPanel.setLayout(new VerticalLayout)
		verSenias(mainPanel)
		eliminarSeniaButton(mainPanel)
		agregarSenia(mainPanel)
		aceptarButton(mainPanel)
	}
	
	def setWindowTitle() {
		this.setTitle("Editar señas particulares")
	}
	
	def verSenias(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel) => [
			setText("Seña")
			setBackground(Color::lightGray)
		]
		
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("seniaSeleccionada")
			bindItemsToProperty("seniasParticulares")
		]
	}
	
	def eliminarSeniaButton(Panel mainPanel) {
		val eliminarButtonPanel = new Panel(mainPanel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarSeniaParticular ]
			setBackground(Color::lightGray)
			bindEnabledToProperty("seleccionoSeniaABorrar")
		]
	}
	
	def agregarSenia(Panel mainPanel) {
		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		val seniaParticular = new TextBox(agregarPanel).width = 230
		seniaParticular.bindValueToProperty("seniaNueva")
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarSeniaParticular ]
			setBackground(Color::lightGray)
			bindEnabledToProperty("haySeniaParaAgregar")
		]
	}
	
	def aceptarButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
			setBackground(Color::lightGray)
		]
	}

}