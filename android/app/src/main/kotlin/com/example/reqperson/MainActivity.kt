package com.example.reqperson

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    
        MethodChannel(
        flutterEngine.dartExecutor,
        "flavor"
        ).setMethodCallHandler { _, result -> result.success(BuildConfig.FLAVOR) }
    }
}
