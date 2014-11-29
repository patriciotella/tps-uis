package com.carmensandiego;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import com.carmensandiego.R;
import domain.Juego;
import domain.JuegoIniciadoModelApp;
import domain.Pais;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;
import service.CarmenService;

@SuppressWarnings("all")
public class MainActivity extends ActionBarActivity {
  private JuegoIniciadoModelApp juego;
  
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    this.setContentView(R.layout.activity_main);
    this.getIniciarJuego();
    View _findViewById = this.findViewById(R.id.ubicacion_actual);
    final Procedure1<EditText> _function = new Procedure1<EditText>() {
      public void apply(final EditText it) {
        Juego _juegoActual = MainActivity.this.juego.getJuegoActual();
        Pais _paisActual = _juegoActual.getPaisActual();
        String _nombre = _paisActual.getNombre();
        it.setText(_nombre);
      }
    };
    ObjectExtensions.<EditText>operator_doubleArrow(
      ((EditText) _findViewById), _function);
  }
  
  public void getIniciarJuego() {
    final CarmenService service = this.createService();
    service.iniciarJuego(
      new Callback<JuegoIniciadoModelApp>() {
        public void failure(final RetrofitError e) {
          String _message = e.getMessage();
          Log.e("", _message);
          e.printStackTrace();
        }
        
        public void success(final JuegoIniciadoModelApp juegoIniciado, final Response arg1) {
          MainActivity.this.juego = juegoIniciado;
        }
      });
  }
  
  public CarmenService createService() {
    CarmenService _xblockexpression = null;
    {
      final String SERVER_IP = "127.0.0.1";
      StringConcatenation _builder = new StringConcatenation();
      _builder.append("http://");
      _builder.append(SERVER_IP, "");
      _builder.append(":9000/");
      final String API_URL = _builder.toString();
      RestAdapter.Builder _builder_1 = new RestAdapter.Builder();
      RestAdapter.Builder _setEndpoint = _builder_1.setEndpoint(API_URL);
      final RestAdapter restAdapter = _setEndpoint.build();
      final CarmenService carmenService = restAdapter.<CarmenService>create(CarmenService.class);
      _xblockexpression = carmenService;
    }
    return _xblockexpression;
  }
  
  public boolean onCreateOptionsMenu(final Menu menu) {
    MenuInflater _menuInflater = this.getMenuInflater();
    _menuInflater.inflate(com.carmensandiego.R.menu.main, menu);
    return true;
  }
  
  public boolean onOptionsItemSelected(final MenuItem item) {
    final int id = item.getItemId();
    if ((id == com.carmensandiego.R.id.action_settings)) {
      return true;
    }
    return super.onOptionsItemSelected(item);
  }
}
