package com.carmensandiego

import android.support.v7.app.ActionBarActivity
import domain.JuegoIniciadoModelApp
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.TextView
import android.widget.Spinner
import java.util.ArrayList
import android.widget.ArrayAdapter
import android.widget.Button
import android.content.Intent
import service.ServiceFactory
import domain.Juego
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response
import android.util.Log

class ViajarActivity extends ActionBarActivity {

	public static val JUEGO_ACTUAL = "JUEGO_ACTUAL"
	JuegoIniciadoModelApp juego

	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.viajar);
		this.juego = intent.getSerializableExtra(JUEGO_ACTUAL) as JuegoIniciadoModelApp
		mostrarUbicacionActual
		mostrarPaises
		mainActivityButton
		pistasActivityButton
		viajarButton
		volverButton
	}
	
	def volverButton() {
		findViewById(R.id.volver_btn) as Button => [
			onClickListener = [ view |
				volver
			]
		]
		actualizarBoton
	}
	
	def actualizarBoton() {
		if(juego.juegoActual.paisAnterior == null)
			getVolverBtn => [setEnabled(false)]
		else
			Log.e("", juego.juegoActual.paisAnterior.toString)
			getVolverBtn => [setEnabled(true)]
	}
	
	def private getVolverBtn() {
		findViewById(R.id.volver_btn) as Button	
	}
	
	def volver() {
		val service = ServiceFactory.createService
		service.volver(juego.juegoActual.id, new Callback<Juego>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(Juego juegoActual, Response arg1) {
					juego.juegoActual = juegoActual
					mostrarUbicacionActual
					mostrarPaises
					actualizarBoton
				}
			})
	}

	def viajarButton() {
		findViewById(R.id.viajar_btn) as Button => [
			onClickListener = [ view |
				val spinner = spinnerDePaises
				viajar(spinner.selectedItem as String)
			]
		]
	}

	def viajar(String nombreDelPais) {
		val service = ServiceFactory.createService
		service.viajar(juego.juegoActual.id, nombreDelPais,
			new Callback<Juego>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(Juego juegoActual, Response arg1) {
					juego.juegoActual = juegoActual
					mostrarUbicacionActual
					mostrarPaises
				}
			})
	}

	override boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu)
		return true;
	}

	override boolean onOptionsItemSelected(MenuItem item) {
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

	def spinnerDePaises() {
		findViewById(R.id.conexiones) as Spinner
	}

	def mostrarPaises() {
		val nombres = new ArrayList
		juego.juegoActual.paisActual.conexiones.forEach[nombres.add(nombre)]
		val adapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, nombres)
		spinnerDePaises() => [
			setAdapter(adapter)
		]
	}

	def mainActivityButton() {
		findViewById(R.id.orden_btn) as Button => [
			onClickListener = [view|changeToMainActivity(juego)]
		]
	}

	private def changeToMainActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, MainActivity) => [
			putExtra(MainActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}

	def pistasActivityButton() {
		findViewById(R.id.pistas_btn) as Button => [
			onClickListener = [view|changeToPistasActivity(juego)]
		]
	}

	private def changeToPistasActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, PistasActivity) => [
			putExtra(PistasActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
}
