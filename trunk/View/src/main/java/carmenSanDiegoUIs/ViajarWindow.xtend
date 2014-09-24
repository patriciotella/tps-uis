package carmenSanDiegoUIs

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class ViajarWindow extends SimpleWindow<ViajarModelApp> {
	
	new(WindowOwner parent, ViajarModelApp model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setTitle = "Viajar"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).setText('''Estas en: «modelObject.paisActual»''')
		
		new Label(mainPanel).setText("Posibles destinos")
		new List(mainPanel) => [
			bindItemsToProperty("posiblesPaises")
			bindValueToProperty("paisSeleccionado")
		]
		
		val footer = new Panel(mainPanel)
		footer.layout = new HorizontalLayout
		
		new Button(footer) => [
			caption = "Viajar al país anterior"
			onClick [|
				modelObject.viajarAlPaisAnterior
				close
			]
		]
		
		new Button(footer) => [
			caption = "Viajar"
			onClick [|
				modelObject.viajar
				close
			]
			bindEnabledToProperty("seleccionoPais")
		]
	}
	
}