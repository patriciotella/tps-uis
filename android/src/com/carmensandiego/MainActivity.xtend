package com.carmensandiego

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.Spinner
import android.widget.TextView
import domain.JuegoIniciadoModelApp
import java.util.ArrayList
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response
import service.ServiceFactory
import android.view.View

class MainActivity extends ActionBarActivity {

	public static val JUEGO_ACTUAL = "JUEGO_ACTUAL"
	JuegoIniciadoModelApp juego
	
	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		this.juego = intent.getSerializableExtra(JUEGO_ACTUAL) as JuegoIniciadoModelApp
		mostrarUbicacionActual
		mostrarVillanoAcusado
		mostrarVillanos
		emitirOrdenButton
		pistasActivityButton
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

	def emitirOrdenButton() {
		actualizarBoton
		getEmitirOrdenBtn => [
			onClickListener = [ view |
				val spinner = spinnerDeVillanos
				emitirOrden(spinner.selectedItem as String)
			]
		]
	}

	def actualizarBoton() {
		if(juego.juegoActual.emitioOrdenDeArresto){
			emitirOrdenBtn => [
				setEnabled(false)
				setVisibility(View.INVISIBLE)
			]
		}else{
			emitirOrdenBtn => [
				setEnabled(true)
				setVisibility(View.VISIBLE)
			]
		}
	}
	
	def getEmitirOrdenBtn(){
		findViewById(R.id.emitir_orden_btn) as Button
	}
	
	def emitirOrden(String nombreDelVillano) {
		val service = ServiceFactory.createService
		service.acusarVillano(juego.juegoActual.id, nombreDelVillano,
			new Callback<String>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(String mensaje, Response arg1) {
					val spinner = findViewById(R.id.villanos_a_acusar) as Spinner
					juego.juegoActual.villanoAcusado = spinner.selectedItem as String;
					mostrarVillanoAcusado
					actualizarBoton
					actualizarSpinnerDeVillanos
				}
			})
	}

	def mostrarUbicacionActual() {
		findViewById(R.id.ubicacion_actual) as TextView => [
			setText = juego.juegoActual.paisActual.nombre
		]
	}

	def mostrarVillanoAcusado() {
		val villanoAcusado = juego.juegoActual.villanoAcusado
		if (villanoAcusado != null) {
			findViewById(R.id.villano_acusado) as TextView => [
				setText = villanoAcusado
			]
		}
	}

	def mostrarVillanos() {
		actualizarSpinnerDeVillanos
		val nombres = new ArrayList
		juego.expedientesDeVillanos.villanos.forEach[nombres.add(nombre)]
		val adapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, nombres)
		spinnerDeVillanos() => [
			setAdapter(adapter)
		]
	}
	
	def actualizarSpinnerDeVillanos() {
		val titutlo = findViewById(R.id.emitirTitle) as TextView
		if(juego.juegoActual.emitioOrdenDeArresto){
			 titutlo => [setVisibility(View.INVISIBLE)]
			spinnerDeVillanos => [setVisibility(View.INVISIBLE)]
		}else{
			titutlo => [setVisibility(View.VISIBLE)]
			spinnerDeVillanos => [setVisibility(View.VISIBLE)]
		}			
	}
	
	def spinnerDeVillanos() {
		findViewById(R.id.villanos_a_acusar) as Spinner
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
