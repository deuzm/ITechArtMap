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
    
    var settingMarker = false
    
//    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var transitionButton: UIButton!
    var myMapView: GMSMapView?

    
    @IBAction func transitionToTableView(_ sender: Any) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let vc2 = storyboard.instantiateViewController(withIdentifier: "Table") as! TableViewController
         // Present View "Modally
        vc2.sender = self
        vc2.dataSource = markerArray
        self.presentPanModal(vc2)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        settingMarker = true
//
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(
          withLatitude: 53.9118449,
          longitude: 27.5927425,
          zoom: 16
        )
        myMapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        self.view.addSubview(myMapView!)
        myMapView!.delegate = self
        
        self.view.bringSubviewToFront(self.AddButton)
        self.view.bringSubviewToFront(self.transitionButton)
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
                self.markerArray.append(MarkerModel(name: marker.title ?? "", street: marker.snippet ?? ""))
            }))

            self.present(alert, animated: true, completion: nil)
            
            marker.position = coordinate
            marker.map = mapView
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
