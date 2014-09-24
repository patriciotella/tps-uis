package carmenSanDiegoUIs

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button

class OrdenDeArrestoWindow extends SimpleWindow<OrdenDeArrestoModelApp> {
	
	new(WindowOwner parent, OrdenDeArrestoModelApp model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).setText('''Orden de arresto emitida contra: «modelObject.villanoSeleccionado»''' )

		val listaDeVillanosPanel = new Panel(mainPanel)
		listaDeVillanosPanel.layout = new HorizontalLayout
		
		new Label(listaDeVillanosPanel).setText("Villanos: ")
		
		new List(listaDeVillanosPanel) => [
			bindItemsToProperty("villanos")
			bindValueToProperty("villanoSeleccionado")
		]
		
		new Button(mainPanel) => [
			caption = "Generar orden de arresto"
			onClick [| modelObject.emitirOrdenDeArresto]
		]
	}
	
}