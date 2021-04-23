//
//  ViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import GoogleMaps
import PanModal


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
//    @IBAction func tapped(_ sender: Any) {
////        print("Shit")
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let vc2 = storyboard.instantiateViewController(withIdentifier: "Table") as! TableViewController
////        // Present View "Modally
////        self.presentPanModal(vc2)
//    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Shit")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboard.instantiateViewController(withIdentifier: "Table") as! TableViewController
        // Present View "Modally
        self.presentPanModal(vc2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 53.9118449, longitude: 27.5927425, zoom: 16)
         mapView = GMSMapView(frame: self.view.frame, camera: camera)
//        self.view.addSubview(mapView)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
//        self.mapView.delegate = self
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let camera = GMSCameraPosition.camera(withLatitude: 53.9118449, longitude: 27.5927425, zoom: 16)
         mapView = GMSMapView(frame: self.view.frame, camera: camera)
//        self.view.addSubview(mapView)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
         // Custom logic here
         let marker = GMSMarker()
         marker.position = coordinate
         marker.title = "I added this with a long tap"
         marker.snippet = ""
         marker.map = mapView
    }
}

extension ViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }

       var panScrollable: UIScrollView? {
           return nil
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(200)
       }

       var anchorModalToLongForm: Bool {
           return false
       }
}
