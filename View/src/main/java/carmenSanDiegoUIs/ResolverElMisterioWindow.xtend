package carmenSanDiegoUIs

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout

class ResolverElMisterioWindow extends Dialog<Caso> {

	
	new(WindowOwner owner, Caso caso) {
		super(owner, caso)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setWindowTitle()
		setEstasEnLabel(mainPanel)
		
		setBotonera(mainPanel)
		setRecorridoCriminal(mainPanel)
		
		setDestinosFallidos(mainPanel)
	}
	
	def private setBotonera(Panel panel) {
		panel.layout = new HorizontalLayout
		panel.layout = new ColumnLayout(2)

		crearBotoneraJugar(panel)
		crearBotoneraLugares(panel)
	}
	
	def private setEstasEnLabel(Panel panel) {
		val estasEn = new Panel(panel)
		estasEn.layout = new HorizontalLayout
		
		new Label(estasEn) => [
			setText("Estas en: ")
			//bindear al pais actual	
		]
	}
	
	def crearBotoneraJugar(Panel panel) {	
		panel.layout = new VerticalLayout
			
		new Button(panel) => [
			caption = "Orden de Arresto"
			width = 200
			//onClick [ | new OrdenDeArrestoWindow(lalal).open]
		]

		new Button(panel) => [
			caption = "Viajar"
			width = 200
			//onClick [ | new pantalla con paises a viajar ]
		]		

		new Button(panel) => [
			caption = "Expedientes"
			width = 200
		]
		
	}
	
	def crearBotoneraLugares(Panel panel) {
		panel.layout = new VerticalLayout
		new Label(panel).setText("Lugares")

		new Button(panel) => [
			caption = "Biblioteca"
			width = 200
		]

		new Button(panel) => [
			caption = "Club"
			width = 200
		]
		
		new Button(panel) => [
			caption = "Embajada"
			width = 200
		]

	}

	def private setWindowTitle() {
		this.setTitle("Resolviendo: El robo del faraon" )//seria el titulo del crimen o del caso
	}


	
	
	def private setRecorridoCriminal(Panel panel) {
		val recorridoPanel = new Panel(panel)
		recorridoPanel.layout = new VerticalLayout
		
		//imprimir los paises
	}
	
	def private setDestinosFallidos(Panel panel) {
		new Label(panel).setText("Destinos Fallidos")
		/*new List(panel) => [
			width = 300
			height = 150
			bindValueToProperty("conexionSeleccionada")
			bindItemsToProperty("pais.conexiones")
		]*/
	}
}