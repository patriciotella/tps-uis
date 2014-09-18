package carmenSanDiegoUIs

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class InicioDeJuegoWindow extends MainWindow<Caso> {
	
	new(Caso model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		setWindowTitle()
		setLabel(mainPanel, "Detective, tenemos un caso para usted!!")
		setLabel(mainPanel, "BLABLABLABLALBLSLALBLSfjidjszgioñsj")
		setButton(mainPanel)
		//algun metodo que me tire fechas random para el principio del mensaje ?
	}
	
	private def setWindowTitle() {
		this.setTitle("Robo del faraon") //cada caso deberia tener un titulo, este se usa en varias ventanas	
	}
	
	private def setLabel(Panel mainPanel, String text) {
		new Label(mainPanel).setText(text)
	}
	
	private def setButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar el caso"
			onClick [ | new ResolverElMisterioWindow(this, new Caso).open]
		]
	}
	
	
	def static void main(String[] args) {
		val caso = new Caso()
		new InicioDeJuegoWindow(caso).startApplication
	}
	
	
	
}