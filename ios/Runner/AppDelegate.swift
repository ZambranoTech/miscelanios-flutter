import UIKit
import Flutter

import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GMSServices.provideAPIKey("AIzaSyCvikkNZc2DTGwiFNJKAUjYTN81cW3buR8")
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
