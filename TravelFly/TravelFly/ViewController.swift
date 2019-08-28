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
    }
    
    func mapSetup() {
        self.mapView.mapType = .hybridFlyover
        self.mapView.showsBuildings = true
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
    }
    
}

