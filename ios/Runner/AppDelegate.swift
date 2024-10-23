import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      let controller = window?.rootViewController as! FlutterViewController
      let methodchannel = FlutterMethodChannel(name:"com.bajajfinserv.in/method_channel",binaryMessenger: controller.binaryMessenger)
      methodchannel.setMethodCallHandler({
          [weak self](call: FlutterMethodCall,result:@escaping FlutterResult)-> Void in
          
          if(call.method == "showToast") {
              let message = call.arguments as! String
              let alert = UIAlertController(title: "Alert view",message: message,preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
              self?.window.rootViewController?.present(alert,animated: true,completion: nil)
          }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
