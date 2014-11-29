package com.carmensandiego

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.EditText
import android.widget.ImageButton
import retrofit.RestAdapter
import service.CarmenService
import domain.JuegoIniciadoModelApp
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response
import android.util.Log

class MainActivity extends ActionBarActivity {

	JuegoIniciadoModelApp juego

	override protected onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		iniciarJuego

		findViewById(R.id.ubicacion_actual) as EditText => [
			setText = juego.juegoActual.paisActual.nombre;
		]

	//        findViewById(R.id.viajar_btn) as ImageButton => [
	//			onClickListener = [view | changeToViajarActivity(view)]
	//		]
	//		
	//		findViewById(R.id.pistas_btn) as ImageButton => [
	//			onClickListener = this
	//		]
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
					juego = juegoIniciado
				}
			})
	}

	def createService() {
//		val SERVER_IP = "10.0.2.2"
		val SERVER_IP = "127.0.0.1"
		val API_URL = '''http://«SERVER_IP»:9000/'''

		val restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build
		val CarmenService carmenService = restAdapter.create(CarmenService)
		carmenService
	}

	override boolean onCreateOptionsMenu(Menu menu) {

		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
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
		return super.onOptionsItemSelected(item);
	}

//    private def changeToViajarActivity(View view) {
//    	val myIntent = new Intent(view.getContext(), Activity2.class);
//                startActivityForResult(myIntent, 0);
//    }
}
