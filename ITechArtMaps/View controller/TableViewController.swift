//
//  TableViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import PanModal

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension TableViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }

    var panScrollable: UIScrollView? {
       return tableView
    }

    var longFormHeight: PanModalHeight {
       return .maxHeightWithTopInset(257)
    }

    var anchorModalToLongForm: Bool {
       return false
    }
    }
