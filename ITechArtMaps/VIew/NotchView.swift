//
//  NotchView.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import Foundation
import UIKit

class NotchView: UIView {
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let notch:UIView = {
        let notch = UIView()
        notch.translatesAutoresizingMaskIntoConstraints = false
        notch.backgroundColor = UIColor.blue
        notch.layer.cornerRadius = 4.0
        return notch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        containerView.addSubview(notch)
        self.addSubview(containerView)

        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.heightAnchor.constraint(equalToConstant: 24),

            self.notch.topAnchor.constraint(equalTo: self.containerView.topAnchor , constant: 4),
            self.notch.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            self.notch.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
}
