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
			bindItemsToProperty("mapamundi.paises")
			bindValueToProperty("paisSeleccionado")
		]
		
		val botonesPanel = new Panel (paisesPanel)
		botonesPanel.layout = new VerticalLayout
		
			new Button(botonesPanel) =>[
				caption = "Eliminar"
				width = 100
				onClick [|this.modelObject.eliminarPais()]
				bindEnabledToProperty("mapamundi.tienePaises")
				bindEnabledToProperty("seleccionoPais")
			]
		
			new Button(botonesPanel) =>[
				caption = "Editar"
				width = 100
				onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi, modelObject.paisSeleccionado)) => [
					setTitle("Mapamundi - Editar País")
					open
					]
				]
				bindEnabledToProperty("mapamundi.tienePaises")
				bindEnabledToProperty("seleccionoPais")
			]
		
			new Button(botonesPanel) =>[
				caption = "Nuevo"
				width = 100
				onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi, new Pais())) => [
					setTitle("Mapamundi - Nuevo País")
					open
					]
				]
			]
		
		val datosPais = new Panel(mainPanel)
		datosPais.layout = new VerticalLayout
			val nombrePais = new Panel (datosPais)
			nombrePais.layout = new HorizontalLayout
			new Label(nombrePais).setText("Nombre:")
			new Label(nombrePais) => [ 
			bindValueToProperty("paisSeleccionado.nombre")
			width = 150
			height = 20
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
				bindItemsToProperty("paisSeleccionado.caracteristicas")
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
				bindItemsToProperty("paisSeleccionado.conexiones")
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
				bindItemsToProperty("paisSeleccionado.lugaresDeInteres")
			]
	}
	
	def static void main(String[] args) {
		var mapamundi = new Mapamundi
		var arg = new Pais
		arg.setNombre("Argentina")
		arg.agregarCaracteristica("holiz")
		var chi = new Pais
		chi.setNombre("Chile")
		arg.agregarConexion(chi)
		var banco = new Banco
		arg.agregarLugarDeInteres(banco)
		mapamundi.agregarPais(arg)
		mapamundi.agregarPais(chi)
		var editor = new EditorDeMapamundi(mapamundi)
		new MapamundiWindow(editor).startApplication
	}
}