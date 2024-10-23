package com.example.rutuja_fintech_application

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity(){
    private var methodChannelName = "com.bajajfinserv.in/method_channel"
    private var eventChannelName = "com.bajajfinserv.in/event_channel"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
         val methodChannel = MethodChannel(messenger,methodChannelName)
        val eventChannel = EventChannel(messenger,eventChannelName)
        methodChannel.setMethodCallHandler { call, result ->
            if(call.method=="getResult"){
                result.success("Result from Android")
            }else if(call.method=="showDialog"){
                val message = call.arguments as HashMap<String,String>
                val dialog = Dialog(this)
                dialog.setTitle(message["dialog_key"])
                dialog.show()
               // Toast.makeText(this,"Toast from android",Toast.LENGTH_LONG).show()
            }

            else{
                result.error("404","Method not found","No such method exists in the library")
            }
        }
        val result=methodChannel.invokeMethod("androidToFlutter","1234")

        eventChannel.setStreamHandler(MyEventHandler())
    }
}

