//
//  SecondViewController.swift
//  PaymentTest
//
//  Created by Egor on 08.06.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class SecondViewController: UIViewController {
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupObservers()
        self.moveIn()
    }
    
    func setupView(){
        self.selectView.roundCorners([.topLeft, .topRight], radius: 10)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    func moveIn() {
        self.selectView.center.y = self.selectView.center.y + self.selectView.frame.height
        self.closeButton.center.y = self.closeButton.center.y + self.selectView.frame.height

        UIView.animate(withDuration: 0.25) {
            self.selectView.center.y = self.selectView.center.y - self.selectView.frame.height
            self.closeButton.center.y = self.closeButton.center.y - self.selectView.frame.height
        }
    }
    
    func moveOut() {
        UIView.animate(withDuration: 0.25, animations: {
            self.selectView.center.y = self.selectView.center.y + self.selectView.frame.height
            self.closeButton.center.y = self.closeButton.center.y + self.selectView.frame.height
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    
    func setupObservers(){
        self.closeButton.reactive.tap.observeNext { (tap) in
            self.moveOut()
        }
        
        self.paymentButton.reactive.tap.observeNext { (tap) in
            let nextVC = TemplateViewController()
            nextVC.type = .payment
            self.moveOut()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        self.transferButton.reactive.tap.observeNext { (tap) in
            let nextVC = TemplateViewController()
            nextVC.type = .transfer
            self.moveOut()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        self.view.reactive.tapGesture().observeNext{ (tap) in
            self.moveOut()
        }
    }
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
      }
}
