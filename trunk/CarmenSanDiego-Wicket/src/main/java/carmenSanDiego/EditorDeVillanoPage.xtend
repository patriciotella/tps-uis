package carmenSanDiego

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import villano.Villano
import org.apache.wicket.markup.html.basic.Label

class EditorDeVillanoPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
//	private final Villano villano
	private final HomePage mainPage
	
	new(HomePage mainPage) {
		this.mainPage = mainPage
		
//		this.villano = villanoAEditar
		this.addChild(new Label("EditarVillano"))
		
	}
}