//
//  TemplateViewController.swift
//  PaymentTest
//
//  Created by Egor on 09.06.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {
    
    var type: Template?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
    }
    
    func configView(){
        self.navigationController?.navigationBar.isHidden = false
        switch self.type {
        case .transfer:
            self.title = "Шаблон переводов"
        case .payment:
            self.title = "Шаблон платежей"
        default:
            self.title = "Шаблон"
        }
    }
    
}

enum Template {
    case transfer
    case payment
}
