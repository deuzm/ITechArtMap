////
////  MapViewController.swift
////  ITechArtMaps
////
////  Created by Лиза  Малиновская on 4/23/21.
////
//
//import UIKit
//import GoogleMaps
//
//class MapViewController: UIViewController {
//
////    @IBOutlet weak var mapView: GMSMapView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let camera = GMSCameraPosition.camera(withLatitude: 53.9118449, longitude: 27.5927425, zoom: 16)
//         mapView = GMSMapView(frame: self.view.frame, camera: camera)
////        self.view.addSubview(mapView)
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//        
////        self.mapView.delegate = self
//        // Do any additional setup after loading the view.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//extension MapViewController: GMSMapViewDelegate {
//    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
//         // Custom logic here
//         let marker = GMSMarker()
//         marker.position = coordinate
//         marker.title = "I added this with a long tap"
//         marker.snippet = ""
//         marker.map = mapView
//    }
//}
