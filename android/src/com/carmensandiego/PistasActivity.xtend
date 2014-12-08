package com.carmensandiego

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.view.Menu
import android.view.MenuItem
import android.widget.Button
import android.widget.TextView
import domain.JuegoIniciadoModelApp

class PistasActivity extends ActionBarActivity {
	
	public static val JUEGO_ACTUAL = "JUEGO_ACTUAL"
	JuegoIniciadoModelApp juego
	
	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.pistas);
		this.juego = intent.getSerializableExtra(JUEGO_ACTUAL) as JuegoIniciadoModelApp
		mostrarUbicacionActual
		lugar1
		mainActivityButton
		viajarActivityButton
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
	
	def lugar1() {
		findViewById(R.id.lugar_1_btn) as Button => [
			setText(juego.juegoActual.paisActual.lugaresDeInteres.get(0).nombre)
			onClickListener = [ view |
			]
		]
	}
	
	def lugar2() {
		findViewById(R.id.lugar_2_btn) as Button => [
			setText(juego.juegoActual.paisActual.lugaresDeInteres.get(1).nombre)
			onClickListener = [ view |
			]
		]
	}
	
	def lugar3() {
		findViewById(R.id.lugar_3_btn) as Button => [
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
	
	def viajarActivityButton(){
		findViewById(R.id.viajar_btn) as Button => [
			onClickListener = [view | changeToViajarActivity(juego)]
			]
	}
	
    private def changeToViajarActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, ViajarActivity) => [
			putExtra(ViajarActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
}