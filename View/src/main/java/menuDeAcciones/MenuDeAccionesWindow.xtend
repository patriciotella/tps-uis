package menuDeAcciones

import carmenSanDiegoUIs.MenuDeAcciones
import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import java.util.HashSet
import villano.Villano
import carmenSanDiegoUIs.Caso
import java.util.Set
import mapamundi.Mapamundi
import mapamundi.MapamundiWindow
import mapamundi.EditorDeMapamundi
import carmenSanDiegoUIs.ExpedienteWindow
import carmenSanDiegoUIs.ExpedientesModelApp

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
			setText("¿Que haremos ahora detective?")
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
			//onClick [ onClick [ | new ResolverMisterioWindow(this, new EditorDeLugaresDeInteres(this.modelObject)).open ]
			//			bindEnabledToProperty("caso")
			//			disableOnError
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
		val Set<Villano> villanos = new HashSet
		val Set<Caso> caso = new HashSet
		new MenuDeAccionesWindow(new MenuDeAcciones(new Mapamundi, villanos, caso)).startApplication
	}

}
