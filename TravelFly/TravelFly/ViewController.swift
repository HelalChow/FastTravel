//
//  ViewController.swift
//  TravelFly
//
//  Created by Helal Chowdhury on 8/28/19.
//  Copyright © 2019 Helal Chowdhury. All rights reserved.
//

import UIKit
import FlyoverKit
import MapKit
import Speech

class ViewController: UIViewController, MKMapViewDelegate, SFSpeechRecognizerDelegate {
    
    var userInputLocation = FlyoverAwesomePlace.parisEiffelTower
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale.init(identifier: "en-us"))
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechRecognizer?.delegate = self
        SFSpeechRecognizer.requestAuthorization {
            status in
            var buttonState = false
            switch status {
            case .authorized:
                buttonState = true
                print("Permission recieved")
            case .denied:
                buttonState = false
                print("User did not grant permssion for speech recognition")
            case .notDetermined:
                buttonState = false
                print("Speech recofgnition not allowed by user")
            case .restricted:
                buttonState = false
                print("Speech recognition is not supported on this device")
                
            }
        }
        
        self.mapSetup()
        
        
    }
    

  
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var placeLabel: UILabel!
    
    
    
    @IBAction func locationButtonClicked(_ sender: Any) {
        
        
        
        
        
        
        
//        let rand = locationDictionary.randomElement()!
//        let camera = FlyoverCamera(mapView: self.mapView, configuration: FlyoverCamera.Configuration(duration: 6.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
//        camera.start(flyover: rand.value)
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
//            camera.stop()
//        } )
        
//        placeLabel.text = "\(rand.key)"
    }
    
    func mapSetup() {
        self.mapView.mapType = .hybridFlyover
        self.mapView.showsBuildings = true
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
        
        let camera = FlyoverCamera(mapView: self.mapView, configuration: FlyoverCamera.Configuration(duration: 56.0, altitude: 300, pitch: 45.0, headingStep: 20.0))
        camera.start(flyover: self.userInputLocation)
        DispatchQueue.main.asyncAfter(deadline: .now() + .second(9), execute: {
            camera.stop()
        })
    }
    
    let locationDictionary = [
        "Statue of Liberty": FlyoverAwesomePlace.newYorkStatueOfLiberty,
        "Central Park": FlyoverAwesomePlace.centralParkNY,
        "Golden Gate Bridge": FlyoverAwesomePlace.sanFranciscoGoldenGateBridge,
        "Miami Beach": FlyoverAwesomePlace.miamiBeach,
        "Rome Collosseum": FlyoverAwesomePlace.romeColosseum,
        "Big Ben": FlyoverAwesomePlace.londonBigBen,
        "London Eye": FlyoverAwesomePlace.londonEye,
        "Eiffel Tower": FlyoverAwesomePlace.parisEiffelTower
    ]

    
}

