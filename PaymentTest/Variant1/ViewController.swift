//
//  ViewController.swift
//  PaymentTest
//
//  Created by Egor on 08.06.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configScreen()
        self.configObservers()
    }
    
    func configScreen() {
        self.textLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    }
    
    func configObservers(){
//        self.menuButton.reactive.tap.observeNext { (tap) in
//            let popUpVC = SecondViewController()
//            self.addChild(popUpVC)
//            popUpVC.view.frame = self.view.frame
//            self.view.addSubview(popUpVC.view)
//            popUpVC.didMove(toParent: self)
//        }
    }

    
    @IBAction func onActionTapped(_ sender: Any) {
        let popUpVC = SecondViewController()
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    }
    
}
