package carmenSanDiegoUIs

import java.awt.Color
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import villano.EditorDeVillano
import villano.NuevoVillanoWindow
import villano.Villano

class ExpedienteWindow extends SimpleWindow<ExpedientesModelApp> {

	
	new(WindowOwner owner, ExpedientesModelApp model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes")
		mainPanel.layout = new ColumnLayout(2)

		agregarContenidoPrimerColumna(mainPanel)

		agregarContenidoSegundaColumna(mainPanel)
	}
	
	def agregarContenidoPrimerColumna(Panel mainPanel) {
		val villanosPanel = new Panel(mainPanel)
		villanosPanel.layout = new VerticalLayout
		new Label(villanosPanel) => [
			setText("Villano")
			setBackground(Color::lightGray)
		]
		new List(villanosPanel) => [
			width = 150
			height = 280
			bindItemsToProperty("villanos").adapter = new PropertyAdapter(Villano, "nombre")
			bindValueToProperty("villanoSeleccionado")
		]
		
		val botonesPanel = new Panel(villanosPanel)
		botonesPanel.layout = new VerticalLayout
		
		new Button(botonesPanel) => [
			caption = "Eliminar"
			width = 100
			onClick [ |modelObject.eliminarVillano]
			bindEnabledToProperty("seleccionoVillano")
			disableOnError
		]
		
		new Button(botonesPanel) => [
			caption = "Editar"
			width = 100
			onClick [ |
				new NuevoVillanoWindow(this,
					new EditorDeVillano(this.modelObject.villanoSeleccionado, this.modelObject)) => [
					setTitle("Expedientes - Editar Villano")
					open
				]
			]
			bindEnabledToProperty("seleccionoVillano")
			disableOnError
		]
		
		new Button(botonesPanel) => [
			caption = "Nuevo"
			width = 100
			onClick [ |
				new NuevoVillanoWindow(this, new EditorDeVillano(modelObject)) => [
					setTitle("Expedientes - Nuevo Villano")
					open
				]
			]
		]
	}
	
	def agregarContenidoSegundaColumna(Panel mainPanel) {
		val datosVillano = new Panel(mainPanel)
		datosVillano.layout = new VerticalLayout
		val nombreVillano = new Panel(datosVillano)
		nombreVillano.layout = new HorizontalLayout
		new Label(nombreVillano).setText("Nombre:")
		new Label(nombreVillano) => [
			bindValueToProperty("villanoSeleccionado.nombre")
			width = 150
			height = 20
		]
		
		val sexoVillano = new Panel(datosVillano)
		sexoVillano.layout = new HorizontalLayout
		new Label(sexoVillano).setText("Sexo:")
		new Label(sexoVillano) => [
			bindValueToProperty("villanoSeleccionado.sexo")
			width = 150
			height = 20
		]
		
		val seniasVillano = new Panel(datosVillano)
		seniasVillano.layout = new VerticalLayout
		new Label(seniasVillano).setText("Señas Particulares:")
		new Label(seniasVillano) => [
			setText("Seña")
			setBackground(Color::lightGray)
		]
		new List(seniasVillano) => [
			width = 150
			height = 100
			bindItemsToProperty("villanoSeleccionado.seniasParticulares")
		]
		
		val hobbiesVillano = new Panel(datosVillano)
		hobbiesVillano.layout = new VerticalLayout
		new Label(hobbiesVillano).setText("Hobbies:")
		new Label(hobbiesVillano) => [
			setText("Hobbie")
			setBackground(Color::lightGray)
		]
		new List(hobbiesVillano) => [
			width = 150
			height = 100
			bindItemsToProperty("villanoSeleccionado.hobbies")
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}
