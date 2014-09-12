package mapamundi

import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class MapamundiWindow extends MainWindow<Mapamundi> {
	
	
	new(Mapamundi model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi")
		mainPanel.layout = new ColumnLayout(2)
		
		val paisesPanel = new Panel(mainPanel)
		paisesPanel.layout = new VerticalLayout
		new Label(paisesPanel) =>[
			setText("Paises")
			setBackground(Color::lightGray)
		]
		new List(paisesPanel) =>[
			width = 150
			height = 300
		]
		
		val botonesPanel = new Panel (paisesPanel)
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
		
		val datosPais = new Panel(mainPanel)
		datosPais.layout = new VerticalLayout
			val nombrePais = new Panel (datosPais)
			nombrePais.layout = new HorizontalLayout
			new Label(nombrePais).setText("Nombre:")
			new Label(nombrePais).setText("bindconPais")
		
			val caracteristicasPais = new Panel(datosPais)
			caracteristicasPais.layout = new VerticalLayout
			new Label(caracteristicasPais).setText("Caracteristicas:")
			new Label(caracteristicasPais) =>[
				setText("Caracterisiticas")
				setBackground(Color::lightGray)
			]
			new List(caracteristicasPais) =>[
				width= 100
				height= 50
			]
			
			val conexionesPais = new Panel(datosPais)
			conexionesPais.layout = new VerticalLayout
			new Label(conexionesPais).setText("Conexiones")
			new Label(conexionesPais) =>[
				setText("Conexiones")
				setBackground(Color::lightGray)
			]
			new List(conexionesPais) =>[
				width= 100
				height= 50
			]
			
			val lugaresDeInteresPais = new Panel(datosPais)
			lugaresDeInteresPais.layout = new VerticalLayout
			new Label(lugaresDeInteresPais).setText("Lugares de interes")
			new Label(lugaresDeInteresPais) =>[
				setText("Lugares de interes")
				setBackground(Color::lightGray)
			]
			new List(lugaresDeInteresPais) =>[
				width= 100
				height= 50
			]
	}
	
	def static void main(String[] args) {
		var mapamundi = new Mapamundi
		new MapamundiWindow(mapamundi).startApplication
	}
}