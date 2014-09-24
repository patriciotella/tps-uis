package carmenSanDiegoUIs

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class InicioDeJuegoWindow extends SimpleWindow<Sistema> {
	

	
	new(WindowOwner parent, Sistema model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
		setWindowTitle()
		setLabel(mainPanel, "Detective, tenemos un caso para usted!!")
		setLabel(mainPanel, modelObject.caso.reporte.descripcion)
		setButton(mainPanel)
	}
	
	private def setWindowTitle() {
		this.setTitle(modelObject.caso.nombre) //cada caso deberia tener un titulo, este se usa en varias ventanas	
	}
	
	private def setLabel(Panel mainPanel, String text) {
		new Label(mainPanel).setText(text)
	}
	
	private def setButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar el caso"
			onClick [ | new ResolverElMisterioWindow(this, modelObject).open]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}