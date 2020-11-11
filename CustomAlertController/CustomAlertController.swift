//
//  CustomAlertController.swift
//  CustomAlertController
//
//  Created by Ilhad on 8/19/20.
//  Copyright © 2020 KeenCompany. All rights reserved.
//

import Foundation
import UIKit


class CustomAlertController: UIViewController, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        //
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //
    }
    
    
    let standartAlert = UIView()
    let alertVithTextField = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("okay")
    }
    
    
    func standartAlertView(alertViewBackgroundColor: UIColor, titleViewBackgroundColor: UIColor, textColor: UIColor, title: String, titleAlignment: NSTextAlignment, titleFontSize: CGFloat ) {
    
        
        
        standartAlert.backgroundColor = alertViewBackgroundColor
        
        self.view.addSubview(standartAlert)
        
        
        standartAlert.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [standartAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           standartAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                           standartAlert.widthAnchor.constraint(equalToConstant: 250),
                           standartAlert.heightAnchor.constraint(equalToConstant: 250)]
        
        
        NSLayoutConstraint.activate(constraints)
        
        standartAlert.addSubview(setTitleView(titleViewBackgroundColor: titleViewBackgroundColor, textColor: textColor, title: title, titleAlignment: titleAlignment, titleFontSize: titleFontSize))
        
    }
    
    
    func setTitleView(titleViewBackgroundColor: UIColor, textColor: UIColor, title: String, titleAlignment: NSTextAlignment, titleFontSize: CGFloat ) -> UIView {
        print("yes")
        
        let titleView = UIView()
        let textView = UILabel()
        
        
        
        titleView.backgroundColor = titleViewBackgroundColor
        textView.text = title
        textView.textAlignment = titleAlignment
        textView.textColor = textColor
        //textView.font.withSize(titleFontSize)
        
        UIView.transition(with: textView, duration: 5, options: .curveEaseIn, animations: {
            titleView.addSubview(textView)
            self.standartAlert.addSubview(titleView)
        }, completion: nil)
        
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [titleView.widthAnchor.constraint(equalTo: standartAlert.widthAnchor),
                           titleView.heightAnchor.constraint(equalToConstant: 50),
                           titleView.leftAnchor.constraint(equalTo: standartAlert.leftAnchor, constant: 0),
                           titleView.topAnchor.constraint(equalTo: standartAlert.topAnchor, constant: 0)]
        
        
        
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraints = [textView.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 15),
                                textView.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 0),
                                textView.widthAnchor.constraint(equalTo: titleView.widthAnchor)]
        
        
        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(labelConstraints)
        
        
        return titleView
        
    }
    
    func alertWithImage(alertViewBackgroundColor: UIColor, title: String, textColor: UIColor, titleViewBackgroundColor: UIColor, imageName: String) {
          
          alertVithTextField.backgroundColor = alertViewBackgroundColor
          
          self.view.addSubview(alertVithTextField)
          
          
          alertVithTextField.translatesAutoresizingMaskIntoConstraints = false
          
          let constraints = [alertVithTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                             alertVithTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                             alertVithTextField.widthAnchor.constraint(equalToConstant: 250),
                             alertVithTextField.heightAnchor.constraint(equalToConstant: 250)]
          
          
          NSLayoutConstraint.activate(constraints)
          
          alertVithTextField.addSubview(setImageView(imageName: imageName))
      }
    
    
    func setImageView(imageName: String) -> UIView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [imageView.widthAnchor.constraint(equalToConstant: 250),
                           imageView.heightAnchor.constraint(equalToConstant: 250),
                           imageView.centerXAnchor.constraint(equalTo: alertVithTextField.centerXAnchor, constant: 0),
                           imageView.centerYAnchor.constraint(equalTo: alertVithTextField.centerYAnchor, constant: 0)]
        
     //   NSLayoutConstraint.activate(constraints)
        
        return imageView
        
        
    }
    
    
  
    
    
    
    static func showSimpleAlert(parentVC: UIViewController, alertViewBackgroundColor: UIColor, titleViewBackgroundColor: UIColor, textColor: UIColor, title: String, titleAlignment: NSTextAlignment, titleFontSize: CGFloat) {
        
        let vc = CustomAlertController()
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        vc.standartAlertView(alertViewBackgroundColor: alertViewBackgroundColor, titleViewBackgroundColor: titleViewBackgroundColor, textColor: textColor, title: title, titleAlignment: titleAlignment, titleFontSize: titleFontSize)
        
        parentVC.present(vc, animated: true)
        
    }
    
    
    
    static func showAlertWithImage(parentVC: UIViewController, alertViewBackgroundColor: UIColor, buttonTitleColor: UIColor, title: String, titleViewBackgroundColor: UIColor, imageName: String) {
        
        
        let vc = CustomAlertController()
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        vc.alertWithImage(alertViewBackgroundColor: alertViewBackgroundColor, title: title, textColor: buttonTitleColor, titleViewBackgroundColor: titleViewBackgroundColor, imageName: imageName)
        
        parentVC.present(vc, animated: true)
        
    }
    
    
    
}



