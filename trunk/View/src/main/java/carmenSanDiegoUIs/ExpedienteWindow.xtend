package carmenSanDiegoUIs

import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class ExpedienteWindow extends MainWindow<ConfiguradorDeJuego> {
	
	
	new(ConfiguradorDeJuego model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes")
		mainPanel.layout = new ColumnLayout(2)
		
		val villanosPanel = new Panel(mainPanel)
		villanosPanel.layout = new VerticalLayout
		new Label(villanosPanel) =>[
			setText("Villano")
			setBackground(Color::lightGray)
		]
		new List(villanosPanel) =>[
			width = 150
			height = 300
		]
		
		val botonesPanel = new Panel (villanosPanel)
		botonesPanel.layout = new VerticalLayout
		
			new Button(botonesPanel) =>[
				caption = "Eliminar"
				width = 100
			]
		
			new Button(botonesPanel) =>[
				caption = "Editar"
				width = 100
			]
		
			new Button(botonesPanel) =>[
				caption = "Nuevo"
				width = 100
			]
		
		val datosVillano = new Panel(mainPanel)
		datosVillano.layout = new VerticalLayout
			val nombreVillano = new Panel (datosVillano)
			nombreVillano.layout = new HorizontalLayout
			new Label(nombreVillano).setText("Nombre:")
			new Label(nombreVillano).setText("bindconNombre")
			
			val sexoVillano = new Panel (datosVillano)
			sexoVillano.layout = new HorizontalLayout
			new Label(sexoVillano).setText("Sexo:")
			new Label(sexoVillano).setText("bindconsexo")
		
			val seniasVillano = new Panel(datosVillano)
			seniasVillano.layout = new VerticalLayout
			new Label(seniasVillano).setText("Señas Particulares:")
			new Label(seniasVillano) =>[
				setText("Seña")
				setBackground(Color::lightGray)
			]
			new List(seniasVillano) =>[
				width= 100
				height= 50
			]
			
			val hobbiesVillano = new Panel(datosVillano)
			hobbiesVillano.layout = new VerticalLayout
			new Label(hobbiesVillano).setText("Hobbies:")
			new Label(hobbiesVillano) =>[
				setText("Hobbie")
				setBackground(Color::lightGray)
			]
			new List(hobbiesVillano) =>[
				width= 100
				height= 50
			]
	}
	
	def static void main(String[] args) {
		var configurador = new ConfiguradorDeJuego
		new ExpedienteWindow(configurador).startApplication
	}
}