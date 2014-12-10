package com.carmensandiego

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.util.Log
import android.widget.Button
import domain.JuegoIniciadoModelApp
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response
import service.ServiceFactory

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
		val service = ServiceFactory.createService
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

	private def changeToMainActivity(JuegoIniciadoModelApp juego) {
		val intent = new Intent(this, MainActivity) => [
			putExtra(MainActivity.JUEGO_ACTUAL, juego)
		]
		startActivityForResult(intent, 0)
	}
}
