package com.carmensandiego

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.view.Menu
import android.view.MenuItem
import android.widget.Button
import android.widget.TextView
import domain.JuegoIniciadoModelApp
import android.util.Log
import service.ServiceFactory
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response
import android.view.View
import domain.ResolucionDeJuego

class PistasActivity extends ActionBarActivity {

	public static val JUEGO_ACTUAL = "JUEGO_ACTUAL"
	JuegoIniciadoModelApp juego

	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.pistas);
		this.juego = intent.getSerializableExtra(JUEGO_ACTUAL) as JuegoIniciadoModelApp
		mostrarUbicacionActual
		mostrarLugares
		botonesDeNavegacion
	}

	def botonesDeNavegacion() {
		if (juego.juegoActual.paisActual.contieneAlVillano) {
			mainActBtn => [
				setEnabled(false)
				setVisibility(View.INVISIBLE)
			]
			viajarActivityBtn => [
				setEnabled(false)
				setVisibility(View.INVISIBLE)
			]
			resolverMisterioButton
		} else {
			mainActivityButton
			viajarActivityButton
		}
	}

	def mostrarLugares() {
		lugar1
		lugar2
		lugar3
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

	def lugar1() {
		findViewById(R.id.lugar_1_btn) as Button => [
			val nombreDelLugar = juego.juegoActual.paisActual.lugaresDeInteres.get(0).nombre
			setText(nombreDelLugar)
			onClickListener = [view|pedirPista(nombreDelLugar)]
		]
	}

	def lugar2() {
		findViewById(R.id.lugar_2_btn) as Button => [
			val nombreDelLugar = juego.juegoActual.paisActual.lugaresDeInteres.get(1).nombre
			setText(nombreDelLugar)
			onClickListener = [view|pedirPista(nombreDelLugar)]
		]
	}

	def lugar3() {
		findViewById(R.id.lugar_3_btn) as Button => [
			val nombreDelLugar = juego.juegoActual.paisActual.lugaresDeInteres.get(2).nombre
			setText(nombreDelLugar)
			onClickListener = [view|pedirPista(nombreDelLugar)]
		]
	}

	def pedirPista(String nombreDelLugar) {
		val service = ServiceFactory.createService
		service.getPista(juego.juegoActual.id, nombreDelLugar,
			new Callback<String>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(String pista, Response arg1) {
					findViewById(R.id.pista) as TextView => [
						setText = pista
					]
				}
			})
	}

	def mainActivityButton() {
		mainActBtn => [
			onClickListener = [view|changeToMainActivity(juego)]
		]
	}

	private def getMainActBtn() {
		findViewById(R.id.orden_btn) as Button
	}

	private def changeToMainActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, MainActivity) => [
			putExtra(MainActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}

	def viajarActivityButton() {
		viajarActivityBtn => [
			onClickListener = [view|changeToViajarActivity(juego)]
		]
	}

	private def getViajarActivityBtn() {
		findViewById(R.id.viajar_btn) as Button
	}

	private def changeToViajarActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, ViajarActivity) => [
			putExtra(ViajarActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}

	def resolverMisterioButton() {
			findViewById(R.id.resolver_btn) as Button => [
				setVisibility(View.VISIBLE)
				onClickListener = [view|resolverJuego]
			]
	}

	def resolverJuego() {
		val service = ServiceFactory.createService
		service.finalizarPartida(juego.juegoActual.id,
			new Callback<ResolucionDeJuego>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(ResolucionDeJuego resolucion, Response arg1) {
					findViewById(R.id.pista) as TextView => [
						setText = getMensajeDeFinalizacion(resolucion)
					]
				}

			})
	}

	def getMensajeDeFinalizacion(ResolucionDeJuego resolucion) {
		if (resolucion.resolucionDePartida == "Ganaste") {
			"Felicitaciones
	   		Ha detenido a " + resolucion.culpableDelRobo + " y recuperado la " + resolucion.villanoAcusado
		} else {
			mostrarMensajeDePartidaPerdida(resolucion)
		}
	}

	def mostrarMensajeDePartidaPerdida(ResolucionDeJuego resolucion) {
		val mensaje = "Malas noticias "
		if (resolucion.villanoAcusado == null) {
			mensaje + "Ha detenido a " + resolucion.culpableDelRobo +
				" pero ud. no tenia ninguna orden de arrestro en su contra."
		} else {
			mensaje + "Ha detenido a " + resolucion.culpableDelRobo + " pero ud. tenia una orden de arresto contra " +
				resolucion.villanoAcusado
		}
	}
}
