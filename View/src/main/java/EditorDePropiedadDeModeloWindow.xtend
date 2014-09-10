

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout

abstract class EditorDePropiedadDeModeloWindow<T> extends Dialog<T> {
	
	public new(WindowOwner owner, T model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setWindowTitle()
		mainPanel.setLayout(new VerticalLayout)
		listaDePropiedades(mainPanel)
		eliminarButton(mainPanel)
		agregarPropiedadInput(mainPanel)
		aceptarButton(mainPanel)
	}
	
	def protected abstract void setWindowTitle()
	
	def protected abstract void aceptarButton(Panel panel)
	
	def protected abstract void agregarPropiedadInput(Panel panel)
	
	def protected abstract void eliminarButton(Panel panel)
	
	def protected abstract void listaDePropiedades(Panel panel)
	
}