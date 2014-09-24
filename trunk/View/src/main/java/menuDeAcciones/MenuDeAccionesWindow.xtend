package menuDeAcciones

import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import java.util.HashSet
import villano.Villano
import java.util.Set
import mapamundi.Mapamundi
import mapamundi.MapamundiWindow
import mapamundi.EditorDeMapamundi
import carmenSanDiegoUIs.ExpedienteWindow
import carmenSanDiegoUIs.ExpedientesModelApp
import carmenSanDiegoUIs.Sistema
import carmenSanDiegoUIs.ObjetoRobado
import carmenSanDiegoUIs.InicioDeJuegoWindow
import pais.Pais
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import lugarDeInteres.Biblioteca

class MenuDeAccionesWindow extends MainWindow<Sistema> {

	new(Sistema model) {
		super(model)
	}

	override createContents(Panel mainPanel) {
		setWindowTitle()
		setLabel(mainPanel)

		val panel = new Panel(mainPanel)
		panel.layout = new HorizontalLayout
		agregarResolverMisterioButton(panel)
		agregarMapamundiButton(panel)
		agregarExpedientesButton(panel)
	}

	private def setWindowTitle() {
		this.setTitle("¿Dónde está Carmen San Diego?")
	}

	def setLabel(Panel mainPanel) {
		val label = new Panel(mainPanel)
		label.layout = new HorizontalLayout
		new Label(label) => [
			setText("¿Qué haremos ahora detective?")
			width = 340
		]
	}


	private def agregarMapamundiButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Mapamundi"
			onClick [ | new MapamundiWindow(this,new EditorDeMapamundi(modelObject.mapamundi)).open]
			setBackground(Color::lightGray)
		]
	}

	private def agregarResolverMisterioButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Resolver Misterio"
			onClick [ |
				modelObject.crearCaso 
				new InicioDeJuegoWindow(this, modelObject).open
			]
			setBackground(Color::lightGray)
		]
	}
	
	private def agregarExpedientesButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Expedientes"
			onClick [ | new ExpedienteWindow(this,new ExpedientesModelApp(modelObject.villanos)).open ]
			setBackground(Color::lightGray)
		]
	}


	def static void main(String[] args) {
		val alberto = new Villano("Alberto", "Masculino",
			newHashSet => [add("Seña") add("Otra seña")],
			newHashSet => [add("Jugador")]
		)
		val carlos = new Villano("Carlos", "Masculino",
			newHashSet => [add("Guiña el ojo") add("Aplaude")],
			newHashSet => [add("Hacker")]
		)
		val brasil = new Pais("Brasil", 
			newHashSet => [add("Tiene playa")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		val argentina = new Pais("Argentina", 
			newHashSet => [add("Toman mate")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		val uruguay = new Pais("Uruguay", 
			newHashSet => [add("Algo")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Biblioteca)
			]
		)
		val chile = new Pais("Chile", 
			newHashSet => [add("Malos al futbol")],
			newHashSet, newHashSet => [
				add(new Club) add(new Biblioteca) add(new Banco)
			]
		)
		val mapamundi = new Mapamundi(
			new HashSet => [
				add(argentina)
				add(chile)
				add(brasil)
				add(uruguay)
			]
		)		
		val objetosRobados = new HashSet => [
			add(new ObjetoRobado("Tumba del faraón", "El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III"))
		]
		val villanos = new HashSet => [
			add(alberto)
			add(carlos)
		]
		val unSistema = new Sistema(mapamundi, villanos, objetosRobados)
		new MenuDeAccionesWindow(unSistema).startApplication
	}

}
