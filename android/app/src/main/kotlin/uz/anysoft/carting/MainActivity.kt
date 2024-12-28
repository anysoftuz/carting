package uz.anysoft.carting

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("c7e0db3f-ca78-4cc9-a206-1985c836e9c7") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
