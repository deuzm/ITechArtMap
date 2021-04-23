//
//  SheetViewController.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit

class SheetViewController: UIViewController {
    let containerVC:ContainerViewController = {
        let vc = ContainerViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    let notchVC:NotchViewController = {
        let vc = NotchViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    let blurredEffectView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurredEffectView
    }()
    
    var heightConstraint:NSLayoutConstraint!
    var notchBottomConstraint:NSLayoutConstraint!
    
    public fileprivate(set) var blackOverlay: UIControl = UIControl()
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          //Also add Blur effect View
          setupBlurView()
    }

    override func viewDidAppear(_ animated: Bool) {
      //setup containerView ( this view contains the place holder for the notch )
       setupContainerView()
    }
    
    func animate() {
            let screenSize = UIScreen.main.bounds
            let heightValue = screenSize.size.height / 2
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.notchBottomConstraint.constant = -heightValue
                self.heightConstraint.constant =  heightValue
                self.view.layoutIfNeeded()
            }, completion: nil)
       }
    
    func setupBlurView() {
            self.view.addSubview(blurredEffectView)
            
            //Set constraints
            NSLayoutConstraint.activate([
                blurredEffectView.topAnchor.constraint(equalTo: self.view.topAnchor),
                blurredEffectView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                blurredEffectView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                blurredEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        }
    
    
    func setupContainerView() {
            [containerVC,notchVC].forEach { (viewController) in
                self.view.addSubview(viewController.view)
            }
            heightConstraint =  containerVC.view.heightAnchor.constraint(equalToConstant: 0)
            notchBottomConstraint = notchVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
            NSLayoutConstraint.activate([
                containerVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                containerVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                containerVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                heightConstraint,
                notchVC.view.heightAnchor.constraint(equalToConstant: 20),
                notchVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                notchVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                notchBottomConstraint
            ])
            
            //setup childViewController ( this view is the bottom sheet )
            [containerVC, notchVC].forEach { (viewController) in
                self.addChild(viewController)
            }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            //deactivate constraints
            heightConstraint.isActive = false
            notchBottomConstraint.isActive = false

            //remove from super view
            self.view.removeFromSuperview()
        }
}
