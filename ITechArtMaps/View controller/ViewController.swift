//
//  ViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
//    @IBOutlet weak var mapView: GMSMapView!
    
//    @IBOutlet weak private var contentView: UIView!
//    @IBOutlet weak private var contentViewBottomConstraint: NSLayoutConstraint!
//    @IBOutlet weak private var contentViewHeight: NSLayoutConstraint!
    
//    private let childViewController: UIViewController
//    private var originBeforeAnimation: CGRect = .zero
    @IBAction func presentBottomSheet(_ sender: Any) {
        
            let myViewController = BottomViewController()
            
            let bottomSheetViewModel = BottomSheetViewModel(
                cornerRadius: 20,
                animationTransitionDuration: 0.3,
                backgroundColor: UIColor.red.withAlphaComponent(0.5)
            )
            
            let bottomSheetVC = BottomSheetViewController(
                viewModel: bottomSheetViewModel,
                childViewController: myViewController
            )
            
            presentBottomSheet(bottomSheetVC, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 53.9118449, longitude: 27.5927425, zoom: 16)
        let mapView = GMSMapView(frame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }


}

