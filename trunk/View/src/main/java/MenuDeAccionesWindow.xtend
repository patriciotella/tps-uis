

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.Label

class MenuDeAccionesWindow extends MainWindow<MenuDeAcciones> {
	
	new(MenuDeAcciones model) {
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
			setText("¿Qué heremos ahora detective?")
			width = 340
			setBackground(Color::lightGray)
		]
	}
	
	private def agregarResolverMisterioButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Resolver Misterio"
			//onClick [ onClick [ | new ResolverMisterioWindow(this, new EditorDeLugaresDeInteres(this.modelObject)).open ]
			bindEnabledToProperty("caso")
			disableOnError
			setBackground(Color::lightGray)
		]
	}
	
	private def agregarMapamundiButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Mapamundi"
			//onClick [ onClick [ | new ResolverMisterioWindow(this, new EditorDeLugaresDeInteres(this.modelObject)).open ]
			bindEnabledToProperty("mapamundi")
			disableOnError
			setBackground(Color::lightGray)
		]
	}
	
	private def agregarExpedientesButton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Expedientes"
			//onClick [ onClick [ | new ResolverMisterioWindow(this, new EditorDeLugaresDeInteres(this.modelObject)).open ]
			bindEnabledToProperty("expedientes")
			disableOnError
			setBackground(Color::lightGray)
		]
	}
	
	def static void main(String[] args) {
		var menuDeAcciones = new MenuDeAcciones(new Mapamundi, new Expedientes, new Caso)
		new MenuDeAccionesWindow(menuDeAcciones).startApplication
	}
	
	
}