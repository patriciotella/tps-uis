package finDelJuego

import org.uqbar.arena.windows.SimpleWindow
import carmenSanDiegoUIs.Sistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.windows.MainWindow
import villano.Villano
import java.util.Set
import java.util.HashSet
import carmenSanDiegoUIs.ObjetoRobado
import mapamundi.Mapamundi
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class JuegoGanadoWindow extends MainWindow<Sistema>{

	
	/*new(WindowOwner parent, Sistema model) {
		super(parent, model)
	}*/
	
	new(Sistema model) {
		super(model)
	}
	
	//override protected createFormPanel(Panel mainPanel) {

//	}
	
	override createContents(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel) => [
			setText = "Enhorabuena !!"
			setHeight(30)
		]
		
		new Label(mainPanel) => [
			setText('''Ha detenido a «modelObject.getVillanoAcusado» y recuperado modelObject.caso.objetoRobado.getNombre''')
			setHeight(30)
		]
		
		new Label(mainPanel) => [
			setText = "Felicitaciones !!"
			setForeground(Color::green)
			setHeight(30)
		]
		
		new Button(mainPanel) => [
			caption = "Disfrutar nuestra victoria"
			onClick [ | close ]
			setBackground(Color::lightGray)
		]
	}
	
	def static void main(String[] args)  {
		val Set<Villano> villanos = new HashSet
		val objetosRobados = new HashSet => [
			add(new ObjetoRobado("Tumba del faraón", "El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III"))
		]
		new JuegoGanadoWindow(new Sistema(new Mapamundi, villanos, objetosRobados)).startApplication
	}
	
	
}