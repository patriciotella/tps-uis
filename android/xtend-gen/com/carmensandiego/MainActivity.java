package com.carmensandiego;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import com.carmensandiego.R;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import retrofit.RestAdapter;
import service.CarmenService;

@SuppressWarnings("all")
public class MainActivity extends ActionBarActivity {
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    this.setContentView(R.layout.activity_main);
    View _findViewById = this.findViewById(R.id.ubicacion_actual);
    final Procedure1<EditText> _function = new Procedure1<EditText>() {
      public void apply(final EditText it) {
        String _ubicacionActual = MainActivity.this.getUbicacionActual();
        it.setText(_ubicacionActual);
      }
    };
    ObjectExtensions.<EditText>operator_doubleArrow(
      ((EditText) _findViewById), _function);
  }
  
  public String getUbicacionActual() {
    String _xblockexpression = null;
    {
      final CarmenService ubicacionService = this.createUbicacionService();
      _xblockexpression = "";
    }
    return _xblockexpression;
  }
  
  public CarmenService createUbicacionService() {
    CarmenService _xblockexpression = null;
    {
      final String SERVER_IP = "10.0.2.2";
      StringConcatenation _builder = new StringConcatenation();
      _builder.append("http://");
      _builder.append(SERVER_IP, "");
      _builder.append(":8080/videoclub-ui-grails-homes-xtend");
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
