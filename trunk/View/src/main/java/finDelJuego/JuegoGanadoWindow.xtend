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
import menuDeAcciones.MenuDeAccionesWindow
import pais.Pais
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import lugarDeInteres.Biblioteca

class JuegoGanadoWindow extends MainWindow<Sistema>{

	
	/*new(WindowOwner parent, Sistema model) {
		super(parent, model)
	}*/
	
	new(Sistema model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		this.setTitle(modelObject.caso.getNombre())
		
		new Label(mainPanel) => [
			setText = "Enhorabuena !!"
			setHeight(30)
		]
		
		new Label(mainPanel) => [
			setText('''Ha detenido a «modelObject.getVillanoAcusado» y recuperado modelObject.caso.objetoRobado''')
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
		new JuegoGanadoWindow(unSistema).startApplication
	}
	
	
	
}