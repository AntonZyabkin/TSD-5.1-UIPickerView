//
//  SingViewController.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import UIKit

class SingViewController: UIViewController {

    @IBOutlet weak var eyePasswordButtonOutlet: UIButton!
    @IBOutlet weak var enterButtolOutlet: UIButton!
    
    @IBOutlet weak var wringEmailLabelOutlet: UILabel!
    
    @IBOutlet weak var emailTextViewOutlet: UITextField!
    @IBOutlet weak var passwordTextViewOutlet: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wringEmailLabelOutlet.text = ""

        title = "Welcome!"
        
        emailTextViewOutlet.keyboardType = .emailAddress
    }
    
    @IBAction func eyePasswordAction(_ sender: UIButton) {
        passwordTextViewOutlet.isSecureTextEntry.toggle()
        
        if passwordTextViewOutlet.isSecureTextEntry {
            
            eyePasswordButtonOutlet.setImage(UIImage(systemName: "eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTextViewOutlet.isSecureTextEntry = false
        } else {
            eyePasswordButtonOutlet.setImage(UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTextViewOutlet.isSecureTextEntry = true
        }
        eyePasswordButtonOutlet.tintColor = .systemBlue

        passwordTextViewOutlet.isSecureTextEntry = !passwordTextViewOutlet.isSecureTextEntry
    }
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        checkTextField (vC: self)
        
    }
    
    
    
    
    
    
    func checkTextField (vC: UIViewController) {
        

        if  (passwordTextViewOutlet.text?.isEmpty)! ||
            (emailTextViewOutlet.text?.isEmpty)! {
            wringEmailLabelOutlet.text = "some field is empty"
            animateView(emailTextViewOutlet)

        } else {
            
            wringEmailLabelOutlet.text = ""
            checkEmailTF(vC: vC)
        }
    }


    func checkEmailTF (vC: UIViewController) {
        
        for i in emailTextViewOutlet.text! {
            
            if i == "@" {
                
                wringEmailLabelOutlet.text = ""
                gobirthdayVC (vC: vC)
                break
                
            } else {
                wringEmailLabelOutlet.text = "wrong e-mail"
                animateView(emailTextViewOutlet)
            }
        }
    }

    func animateView (_ viewToAnimate : UIView) {
        UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform (scaleX: 0.95, y: 0.95)
            
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform (scaleX: 1, y: 1)
                
            }, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextViewOutlet.resignFirstResponder()
        passwordTextViewOutlet.resignFirstResponder()
    }
    
    
    
}
