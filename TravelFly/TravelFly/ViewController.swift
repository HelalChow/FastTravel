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

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapSetup()
        
        
    }
    
    let locationDictionary = [
        "Statue of Liberty": FlyoverAwesomePlace.newYorkStatueOfLiberty,
        "Central Park": FlyoverAwesomePlace.centralParkNY,
        "Golden Gate Bridge": FlyoverAwesomePlace.sanFranciscoGoldenGateBridge,
        "Miami Beach": FlyoverAwesomePlace.miamiBeach,
        "Rome Collosseum": FlyoverAwesomePlace.romeColosseum,
        "Big Ben": FlyoverAwesomePlace.londonBigBen,
        "London Eye": FlyoverAwesomePlace.londonEye,
        "Statue of Liberty": FlyoverAwesomePlace.newYorkStatueOfLiberty,
        "Eiffel Tower": FlyoverAwesomePlace.parisEiffelTower,
    ]
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    @IBOutlet weak var locationButton: UIButton!
    
    
    
    @IBOutlet weak var placeLabel: UILabel!
    
    
    
    @IBAction func locationButtonClicked(_ sender: Any) {
        let rand = locationDictionary.randomElement()!
        let camera = FlyoverCamera(mapView: self.mapView, configuration: FlyoverCamera.Configuration(duration: 6.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
        camera.start(flyover: rand.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
            camera.stop()
        } )
        
        placeLabel.text = "\(rand.key)"
    }
    
    func mapSetup() {
        self.mapView.mapType = .hybridFlyover
        self.mapView.showsBuildings = true
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
    }
    
}

