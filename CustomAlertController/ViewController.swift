//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Ilhad on 8/19/20.
//  Copyright © 2020 KeenCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        
    
    }

    @IBAction func buttonPressed(_ sender: Any) {
       
        
        CustomAlertController.showSimpleAlert(parentVC: self, alertViewBackgroundColor: .red, titleViewBackgroundColor: .black, textColor: .white, title: "Info", titleAlignment: .center, titleFontSize: 18)
           
    }
    
}

