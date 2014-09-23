package pais

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import lugarDeInteres.Club
import lugarDeInteres.Banco
import lugarDeInteres.Embajada
import mapamundi.Mapamundi
import lugarDeInteres.Biblioteca

class EditorDeLugaresDeInteresTest {
	
	EditorDePais editorDePais
	EditorDeLugaresDeInteres editorDeLugares
	Pais argentina
	Mapamundi mapamundi
	
	@Before
	def void setUp() {
		argentina = new Pais("Argentina", 
			newHashSet => [add("Toman mate")],
			newHashSet, newHashSet => [
				add(new Club) add(new Banco) add(new Embajada)
			]
		)
		mapamundi = new Mapamundi => [agregarPais(argentina)]
		editorDePais = new EditorDePais(mapamundi, argentina)
		editorDeLugares = new EditorDeLugaresDeInteres(editorDePais)
	}
	
	@Test
	def losLugaresPosiblesSonLaDiferenciaEntreLosLugaresDeInteresDelPaisYTodosLosLugaresDeInteres() {
		assertEquals(editorDeLugares.lugaresPosibles.get(0).class, new Biblioteca.class)
	}
}