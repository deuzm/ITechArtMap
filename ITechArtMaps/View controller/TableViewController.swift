//
//  TableViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import PanModal

class TableViewController: UITableViewController {
    
    var isShortFormEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panModalSetNeedsLayoutUpdate()
            panModalTransition(to: .shortForm)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarkTableViewCell", for: indexPath) as! MarkTableViewCell
        cell.TitleLabel.text = "MEOW"
        cell.SubtitleLabel.text = "It's a cat"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
}

extension TableViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    var shortFormHeight: PanModalHeight {
            return isShortFormEnabled ? .contentHeight(300.0) : longFormHeight
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
    
    func willTransition(to state: PanModalPresentationController.PresentationState) {
        guard isShortFormEnabled, case .longForm = state
            else { return }

        isShortFormEnabled = false
        panModalSetNeedsLayoutUpdate()
    }
}
