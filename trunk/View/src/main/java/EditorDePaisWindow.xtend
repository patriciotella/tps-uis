

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout

abstract class EditorDePaisWindow<T> extends Dialog<T> {
	
	public new(WindowOwner owner, T model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setWindowTitle()
		mainPanel.setLayout(new VerticalLayout)
		getListaDePropiedades(mainPanel)
		setEliminarButton(mainPanel)
		agregarPropiedadInput(mainPanel)
		setAceptarButton(mainPanel)
	}
	
	def protected abstract void setWindowTitle()
	
	def protected abstract void setAceptarButton(Panel panel)
	
	def protected abstract void agregarPropiedadInput(Panel panel)
	
	def protected abstract void setEliminarButton(Panel panel)
	
	def protected abstract void getListaDePropiedades(Panel panel)
	
}