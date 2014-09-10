import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import java.awt.Color

class EditarHobbiesDeVillanoWindow extends EditorDePropiedadDeModeloWindow<EditorDeHobbiesDeVillano> {
	
	new(WindowOwner owner, EditorDeHobbiesDeVillano model) {
		super(owner, model)
	}
	
	override protected setWindowTitle() {
		this.setTitle("Editar hobbies")	
	}
	
	override protected aceptarButton(Panel panel) {
		val buttonPanel = new Panel(panel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
			setBackground(Color::lightGray)
		]
	}
	
	override protected agregarPropiedadInput(Panel panel) {
		val agregarPanel = new Panel(panel)
		agregarPanel.layout = new HorizontalLayout
		val hobbie = new TextBox(agregarPanel).width = 230
		hobbie.bindValueToProperty("hobbieNuevo")
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarHobbie ]
			setBackground(Color::lightGray)
		]
	}
	
	override protected eliminarButton(Panel panel) {
		val eliminarButtonPanel = new Panel(panel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarHobbie ]
			setBackground(Color::lightGray)
		]	
	}
	
	override protected listaDePropiedades(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel) => [
			setText("Hobbie")
			setBackground(Color::lightGray)
		]
		
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("hobbieSeleccionado")
			bindItemsToProperty("villano.hobbies")
		]
	}
}