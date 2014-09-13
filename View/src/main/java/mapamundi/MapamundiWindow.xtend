package mapamundi

import java.awt.Color
import mapamundi.Mapamundi
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import pais.EditorDePais
import pais.Pais
import pais.PaisWindow
import lugarDeInteres.Banco

class MapamundiWindow extends MainWindow<EditorDeMapamundi> {
	
	
	new(EditorDeMapamundi model) {
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
			bindItemsToProperty("paises")
			bindValueToProperty("conexionSeleccionada")
		]
		
		val botonesPanel = new Panel (paisesPanel)
		botonesPanel.layout = new VerticalLayout
		
			new Button(botonesPanel) =>[
				caption = "Eliminar"
				width = 100
				onClick [|this.modelObject.eliminarPais()]
			]
		
			new Button(botonesPanel) =>[
				caption = "Editar"
				width = 100
				onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi, modelObject.conexionSeleccionada)).open]
			]
		
			new Button(botonesPanel) =>[
				caption = "Nuevo"
				width = 100
				onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi, new Pais())).open]
				onClick [ | this.modelObject.agregarPais()]
			]
		
		val datosPais = new Panel(mainPanel)
		datosPais.layout = new VerticalLayout
			val nombrePais = new Panel (datosPais)
			nombrePais.layout = new HorizontalLayout
			new Label(nombrePais).setText("Nombre:")
			new Label(nombrePais) => [ 
			bindValueToProperty("conexionSeleccionada.nombre")
			width = 150
		]
		
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
				bindItemsToProperty("conexionSeleccionada.caracteristicas")
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
				bindItemsToProperty("conexionSeleccionada.conexiones")
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
				bindItemsToProperty("conexionSeleccionada.lugaresDeInteres")
			]
	}
	
	def static void main(String[] args) {
		var mapamundi = new Mapamundi
		var arg = new Pais
		arg.setNombre("arg")
		arg.agregarCaracteristica("holiz")
		var chi = new Pais
		chi.setNombre("chi")
		arg.agregarConexion(chi)
		var banco = new Banco
		arg.agregarLugarDeInteres(banco)
		mapamundi.agregarPais(arg)
		mapamundi.agregarPais(chi)
		var editor = new EditorDeMapamundi(mapamundi)
		new MapamundiWindow(editor).startApplication
	}
}