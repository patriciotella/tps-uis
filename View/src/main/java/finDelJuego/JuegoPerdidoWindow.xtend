package finDelJuego

import org.uqbar.arena.windows.MainWindow
import carmenSanDiegoUIs.Sistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import java.util.Set
import villano.Villano
import java.util.HashSet
import carmenSanDiegoUIs.ObjetoRobado
import mapamundi.Mapamundi

class JuegoPerdidoWindow extends MainWindow<Sistema> {
	
	new(Sistema model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		//this.setTitle(modelObject.caso.getNombre())
		
		new Label(mainPanel) => [
			setText = "Malas noticias ... "
			setForeground(Color::red)
			setHeight(30)
		]
		
		new Label(mainPanel) => [
			setText('''Ha detenido a «modelObject.getVillanoAcusado» pero usted tenía una orden contra «modelObject.caso.responsable»''')
			setHeight(30)
		]
		
		new Label(mainPanel) => [
			setText = "Lamentablemente este crimen quedará impune"
			setHeight(30)
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar el error cometido"
			onClick [ | close ]
			setBackground(Color::lightGray)
		]
	}


}