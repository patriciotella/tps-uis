package com.carmensandiego

import android.support.v7.app.ActionBarActivity
import android.os.Bundle
import retrofit.Callback
import retrofit.RetrofitError
import android.util.Log
import retrofit.client.Response
import domain.JuegoIniciadoModelApp
import service.CarmenService
import retrofit.RestAdapter
import android.content.Intent
import android.widget.Button

class IniciarJuegoActivity extends ActionBarActivity {

	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.iniciar_juego);
		findViewById(R.id.iniciar_btn) as Button => [
			onClickListener = [view|
				iniciarJuego
			]
		]
	}

	def getIniciarJuego() {
		val service = createService
		service.iniciarJuego(
			new Callback<JuegoIniciadoModelApp>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(JuegoIniciadoModelApp juegoIniciado, Response arg1) {
					changeToMainActivity(juegoIniciado)
				}
			})
	}

	def createService() {
		val SERVER_IP = "192.168.56.1"
		val API_URL = '''http://«SERVER_IP»:9000'''

		val restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build
		val CarmenService carmenService = restAdapter.create(CarmenService)
		carmenService
	}

	private def changeToMainActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, MainActivity) => [
			putExtra(MainActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
}
