package carmenSanDiegoUIs

import org.uqbar.arena.windows.SimpleWindow
import lugarDeInteres.LugarDeInteres
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button

class LugarDeInteresWindow extends SimpleWindow<LugarDeInteres> {
	
	new(WindowOwner parent, LugarDeInteres model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel) => [
			setText('''Estas visitando: «modelObject»''')
			height = 15 //VER SI ESTÁ BIEN
		]
		
		new Label(mainPanel).setText(modelObject.pista)
		
		val botonPanel = new Panel(mainPanel)
		botonPanel.layout = new ColumnLayout(2)
		new Panel(botonPanel)
		
		val columnaDerecha = new Panel(botonPanel)
		new Button(columnaDerecha) => [
			caption = "Continuar"
			onClick [| close]
		] 
	}
	
}