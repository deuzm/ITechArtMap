//
//  TableViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit
import PanModal

class TableViewController: UITableViewController {
    
    var dataSource: [MarkerModel] = []
    var isShortFormEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panModalSetNeedsLayoutUpdate()
            panModalTransition(to: .shortForm)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarkTableViewCell", for: indexPath) as! MarkTableViewCell
        
        cell.TitleLabel.text = dataSource[indexPath.row].name
        cell.SubtitleLabel.text = dataSource[indexPath.row].street
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
        }
}

extension TableViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    var panScrollable: UIScrollView? {
       return tableView
    }

    var topOffset: CGFloat {
       return 0.0
    }

    var springDamping: CGFloat {
       return 1.0
    }

    var transitionDuration: Double {
       return 0.4
    }

    var transitionAnimationOptions: UIView.AnimationOptions {
       return [.allowUserInteraction, .beginFromCurrentState]
    }

    var shouldRoundTopCorners: Bool {
       return false
    }

    var showDragIndicator: Bool {
       return false
    }
}
