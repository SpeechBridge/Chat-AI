package com.example.ai_chat_flutter

import android.graphics.BitmapFactory
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*
import android.graphics.Bitmap
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.benamorn.liveness"
    private var job: Job? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkLiveness" -> checkLiveness(call.arguments, result)
                else -> result.notImplemented()
            }
        }
    }

    private fun checkLiveness(data: Any, result: MethodChannel.Result) {
    if (job?.isActive == false || job == null) {
        job = CoroutineScope(Dispatchers.Main).launch {
            val imageBytes = withContext(Dispatchers.Default) {
                val key = data as Map<String, String>
                val bytesList = key["platforms"] as List<ByteArray>
                val strides = key["strides"] as IntArray
                val width = key["width"] as Int
                val height = key["height"] as Int
                YuvConverter.NV21toJPEG(YuvConverter.YUVtoNV21(bytesList, strides, width, height), width, height, 80)
            }

            val decodedImage = withContext(Dispatchers.Default) { BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size) }
            withContext(Dispatchers.Default) {
                Log.i("got decodedImage", "$decodedImage")
            }

            // Конвертируем Bitmap в массив байтов в формате JPEG
            val stream = ByteArrayOutputStream()
            decodedImage.compress(Bitmap.CompressFormat.JPEG, 100, stream)
            val byteArray = stream.toByteArray()

            // Отправляем массив байтов обратно во Flutter
            result.success(byteArray)
        }
    }
}
}
