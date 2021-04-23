//
//  ViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import GoogleMaps
import PanModal
import GooglePlaces


class ViewController: UIViewController {
    
    var markerArray: [MarkerModel] = []
    
    @IBOutlet weak var mapView: GMSMapView!
    var settingMarker = false
//    @IBAction func tapped(_ sender: Any) {
////        print("Shit")
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let vc2 = storyboard.instantiateViewController(withIdentifier: "Table") as! TableViewController
////        // Present View "Modally
////        self.presentPanModal(vc2)
//    }
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var transitionButton: UIButton!
    
    @IBAction func transitionToTableView(_ sender: Any) {
        print("Shit")
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let vc2 = storyboard.instantiateViewController(withIdentifier: "Table") as! TableViewController
         // Present View "Modally
        vc2.dataSource = markerArray
         self.presentPanModal(vc2)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        settingMarker = true
//
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(self.AddButton)
        self.view.bringSubviewToFront(self.transitionButton)
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
    
    
}
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? TableViewController {
            sender.dataSource = markerArray
        }
    }
}
extension ViewController: GMSMapViewDelegate {
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        if (settingMarker) {
            var address = GMSAddress()
            var addresses = GMSGeocoder()
            let marker = GMSMarker()
            addresses.reverseGeocodeCoordinate(coordinate, completionHandler: {
                responce, error in
                if let address = responce?.firstResult() {
                    print(address)
                    if address.thoroughfare != "" {
                        marker.snippet = address.thoroughfare
                    } else {
                        marker.snippet = address.locality
                    }
                } else {
                    print(error.debugDescription)
                }
            })
            
            let alert = UIAlertController(title: "Choose the name", message: "Enter text here", preferredStyle: .alert)

            alert.addTextField { (textField) in
                textField.text = "Name of the marker"
            }

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                marker.title = (textField?.text) ?? ""
            }))

            self.present(alert, animated: true, completion: nil)
            
            marker.position = coordinate
            marker.map = mapView
            markerArray.append(MarkerModel(name: marker.title ?? "", street: marker.snippet ?? ""))
            settingMarker = false
        }
    }
    
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
