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
	/*
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
*/
}