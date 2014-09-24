package mapamundi

import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import pais.EditorDePais
import pais.PaisWindow

class MapamundiWindow extends SimpleWindow<EditorDeMapamundi> {
	
	
	new(WindowOwner owner, EditorDeMapamundi model) {
		super(owner, model)
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
		
		setEliminarButton(botonesPanel)
		setEditarButton(botonesPanel)
		setNuevoButton(botonesPanel)
		

		
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
				width= 150
				height= 70
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
				width= 150
				height= 70
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
				width= 150
				height= 70
				bindItemsToProperty("paisSeleccionado.lugaresDeInteres")
			]
	}
	
	def setEliminarButton(Panel aPanel) {
		new Button(aPanel) =>[
			caption = "Eliminar"
			width = 100
			onClick [|this.modelObject.eliminarPais()]
			bindEnabledToProperty("seleccionoPais")
		]
	}
	
	def setEditarButton(Panel aPanel) {
		new Button(aPanel) =>[
			caption = "Editar"
			width = 100
			onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi, modelObject.paisSeleccionado)) => [
				setTitle("Mapamundi - Editar País")
				open
				]
			]
			bindEnabledToProperty("seleccionoPais")
		]
	}
	
	def setNuevoButton(Panel aPanel) {
		new Button(aPanel) =>[
			caption = "Nuevo"
			width = 100
			onClick [ | new PaisWindow(this, new EditorDePais(modelObject.mapamundi)) => [
				setTitle("Mapamundi - Nuevo País")
				open
				]
			]
		]
	}
	
//	def static void main(String[] args) {
//		var mapamundi = new Mapamundi
//		mapamundi.agregarPais(new Pais("Argentina", 
//			newHashSet => [add("Toman mate")],
//			newHashSet, newHashSet => [
//				add(new Club) add(new Banco) add(new Embajada)
//			]
//		))
//		var editor = new EditorDeMapamundi(mapamundi)
//		new MapamundiWindow(editor).startApplication
//	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
}