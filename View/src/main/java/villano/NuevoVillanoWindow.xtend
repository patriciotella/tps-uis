package villano

import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NuevoVillanoWindow extends SimpleWindow<EditorDeVillano> {

	new(WindowOwner owner, EditorDeVillano model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		agregarNombreInput(mainPanel)
		agregarSexoInput(mainPanel)
		agregarSeniasParticularesYSuEditor(mainPanel)
		agregarHobbiesYSuEditor(mainPanel)
		agregarAceptarBoton(mainPanel)
	}
	
	def agregarNombreInput(Panel editorPanel) {
		val nombrePanel = new Panel(editorPanel)
		nombrePanel.layout = new HorizontalLayout
		new Label(nombrePanel).setText("Nombre:")
		new TextBox(nombrePanel) => [
			bindValueToProperty("villano.nombre")
			width = 150
		]
	}
	
	def agregarSexoInput(Panel editorPanel) {
		val sexoPanel = new Panel(editorPanel)
		sexoPanel.layout = new HorizontalLayout
		new Label(sexoPanel).setText("Sexo:        ")
		new TextBox(sexoPanel) => [
			bindValueToProperty("villano.sexo")
			width = 150
		]
	}
	
	def agregarSeniasParticularesYSuEditor(Panel mainPanel) {
		agregarEditorDeSeniasParticulares(mainPanel)
		getListaDeSeniasParticulares(mainPanel)
	}
	
	def agregarEditorDeSeniasParticulares(Panel editorPanel){
		val editorDeSeniasPanel = new Panel (editorPanel)
		editorDeSeniasPanel.layout = new HorizontalLayout
		
		new Label(editorDeSeniasPanel) => [
			setText("Señas Particulares: ")
			width = 175
		]	
		
		new Button(editorDeSeniasPanel) => [
			caption = "Editar Señas Particulares"
			onClick [ | new EditarSeniasParticularesDeVillanoWindow(this, new EditorDeSeniasParticularesDeVillano(this.modelObject.villano)).open]
		]
	}
	
	def getListaDeSeniasParticulares(Panel mainPanel){
		val seniasParticulares = new Panel(mainPanel)
		seniasParticulares.layout = new HorizontalLayout
		
		new Label(seniasParticulares) => [
			setText("Seña")
			width = 355
			setBackground(Color::lightGray)
		]
		
		new List(mainPanel) => [
			width = 280
			height = 60
			bindItemsToProperty("villano.seniasParticulares")
		]
	}

	def agregarHobbiesYSuEditor(Panel mainPanel) {
		agregarEditorDeHobbies(mainPanel)
		getListaDeHobbies(mainPanel)
	}
	
	def agregarEditorDeHobbies(Panel editorPanel) {
		val editorDeHobbiesPanel = new Panel (editorPanel)
		editorDeHobbiesPanel.layout = new HorizontalLayout
		
		new Label(editorDeHobbiesPanel) => [
			setText("Hobbies: ")
			width = 175
		]	
		
		new Button(editorDeHobbiesPanel) => [
			caption = "Editar Hobbies"
			onClick [ | new EditarHobbiesDeVillanoWindow(this, new EditorDeHobbiesDeVillano(this.modelObject.villano)).open]
		]
	}
	
	def getListaDeHobbies(Panel mainPanel) {
		val hobbies = new Panel(mainPanel)
		hobbies.layout = new HorizontalLayout
		
		new Label(hobbies) => [
			setText("Hobbie")
			width = 355
			setBackground(Color::lightGray)
		]
		
		new List(mainPanel) => [
			width = 280
			height = 60
			bindItemsToProperty("villano.hobbies")
		]
	}
	
	def agregarAceptarBoton(Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | modelObject.expediente.agregarVillano(modelObject.villano) 
						close
			]
			bindEnabledToProperty("puedeCrearVillano")
			disableOnError
			setBackground(Color::lightGray)
		]
	}
	
		
//	def static void main(String[] args) {
//		new NuevoVillanoWindow(new Villano, new Expedientes).startApplication 
//	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}