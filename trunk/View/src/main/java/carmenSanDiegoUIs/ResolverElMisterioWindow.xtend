package carmenSanDiegoUIs

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout
import java.awt.Color
import org.uqbar.arena.widgets.List

class ResolverElMisterioWindow extends Dialog<Sistema> {

	
	new(WindowOwner owner, Sistema unSistema) {
		super(owner, unSistema)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout
		
		val columnas = new Panel(mainPanel)
		columnas.layout = new ColumnLayout(2)		
		
		val primerColumna = new Panel(columnas)
		primerColumna.layout = new VerticalLayout
		
		new Label(primerColumna).text = "Estás en: " + "Argentina"
		
		new Button(primerColumna) => [
			caption = "Orden de Arresto"
			width = 200
			//onClick [ | new OrdenDeArrestoWindow(lalal).open]
		]
		
		new Label(primerColumna)//<= si emitió orden de arresto
		
		new Button(primerColumna) => [
			caption = "Viajar"
			width = 200
			//onClick [ | new pantalla con paises a viajar ]
		]		

		new Button(primerColumna) => [
			caption = "Expedientes"
			width = 200
		]
		
		val segundaColumna = new Panel(columnas)
		segundaColumna.layout = new VerticalLayout
		
		new Label(segundaColumna).setText("Lugares")

		new Button(segundaColumna) => [
			caption = "Biblioteca" //Relacionarlo con los lugares de interés
								//del país, director con el objeto (llama al
			width = 200			// toString) un botón por cada uno.
		]// En el onclick abrir ventanita dialog con la pista que te tira.

		new Button(segundaColumna) => [
			caption = "Club"
			width = 200
		]
		
		new Button(segundaColumna) => [
			caption = "Embajada"
			width = 200
		]
		
		val footer = new Panel(mainPanel)
		footer.layout = new ColumnLayout(2)
		
		val columnaFooter = new Panel(footer)
		columnaFooter.layout = new VerticalLayout
		
		new Label(columnaFooter).setText("Recorrido criminal: ")
		
		new Label(columnaFooter) => [
			setText("Argentina <- Chile <- Bolivia")
			fontSize = 12
		]

		new Label(columnaFooter).setText("Destinos fallidos: ")
		
		new Label(columnaFooter) => [
			setText("Pais")
			setBackground(Color::lightGray)
		]
		new List(columnaFooter) => [
			height = 50
			width = 20
		]
		/*setWindowTitle()
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