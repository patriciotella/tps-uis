package com.carmensandiego

import android.support.v7.app.ActionBarActivity
import domain.JuegoIniciadoModelApp
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.TextView
import android.widget.Button
import android.content.Intent

class ViajarActivity extends ActionBarActivity{
	
	public static val JUEGO_ACTUAL = "JUEGO_ACTUAL"
	JuegoIniciadoModelApp juego
	
	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.viajar);
		this.juego = intent.getSerializableExtra(JUEGO_ACTUAL) as JuegoIniciadoModelApp
		mostrarUbicacionActual
		pais1
		pais2
		pais3
		mainActivityButton
		pistasActivityButton
	}

	override boolean onCreateOptionsMenu(Menu menu) {

		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu)
		return true;
	}

	override boolean onOptionsItemSelected(MenuItem item) {

		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		val id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item)
	}
	
	def mostrarUbicacionActual() {
		findViewById(R.id.ubicacion_actual) as TextView => [
			setText = juego.juegoActual.paisActual.nombre
		]
	}
	
	def pais1() {
		findViewById(R.id.pais_1_btn) as Button => [
			setText(juego.juegoActual.paisActual.conexiones.get(0).nombre)
			onClickListener = [ view |
			]
		]
	}
	
	def pais2() {
		findViewById(R.id.pais_2_btn) as Button => [
			setText(juego.juegoActual.paisActual.conexiones.get(1).nombre)
			onClickListener = [ view |
			]
		]
	}
	
	def pais3() {
		findViewById(R.id.pais_3_btn) as Button => [
			setText(juego.juegoActual.paisActual.lugaresDeInteres.get(2).nombre)
			onClickListener = [ view |
			]
		]
	}
	def mainActivityButton(){
		findViewById(R.id.orden_btn) as Button => [
			onClickListener = [view | changeToMainActivity(juego)]
			]
	}
	
	private def changeToMainActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, MainActivity) => [
			putExtra(MainActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
	
	def pistasActivityButton(){
		findViewById(R.id.pistas_btn) as Button => [
			onClickListener = [view | changeToPistasActivity(juego)]
			]
	}
	
	private def changeToPistasActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, PistasActivity) => [
			putExtra(PistasActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
	
}