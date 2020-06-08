//
//  SecondViewController.swift
//  PaymentTest
//
//  Created by Egor on 08.06.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectView.roundCorners([.topLeft, .topRight], radius: 10)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.moveIn()
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
    
    @IBAction func xClose(_ sender: Any) {
        self.moveOut()
    }
    
    @IBAction func firstButton(_ sender: Any) {
        print("Вы выбрали переводы")
        self.moveOut()
    }
    
    @IBAction func secondButton(_ sender: Any) {
        print("Вы выбрали платежи")
        self.moveOut()
    }
    @IBAction func tapView(_ sender: Any) {
        self.moveOut()
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
