//
//  AddingInfoViewController.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import UIKit

class AddingInfoViewController: UIViewController {
    
    
    
    var datePicker = UIDatePicker ()
    

    @IBOutlet weak open var choosePhotoButton: UIButton!
    @IBOutlet weak var dateOfBirthdayoutlet: UITextField!
    @IBOutlet weak var maleTextFieldOutlet: UITextField!
    @IBOutlet weak var ageTextFieldOutlet: UITextField!
    
    @IBOutlet weak var fullNameTextFieldOutlet: UITextField!
    
    @IBOutlet weak var phoneNumberTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Adding new person"
        phoneNumberTextFieldOutlet.keyboardType = .numberPad
        
        dateOfBirthdayoutlet.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        
        
        let toolbar = UIToolbar ()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem (barButtonSystemItem: .done, target: self, action: #selector(doneActon))
        let flexSpace = UIBarButtonItem (barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        
        dateOfBirthdayoutlet.inputAccessoryView = toolbar

    } 

    
    @objc func doneActon () {
        getDateFromPicker ()
        view.endEditing(true)
    }

    
    func getDateFromPicker () {
        let formater = DateFormatter ()
        formater.dateFormat = "dd.mm.yyyy"
        dateOfBirthdayoutlet.text = formater.string(from: datePicker.date)
        
    }
    

    
    @IBAction func maleTFAction(_ sender: UITextField) {

    }
    
    @IBAction func ageTFAction(_ sender: Any) {
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dateOfBirthdayoutlet.resignFirstResponder()
        maleTextFieldOutlet.resignFirstResponder()
        fullNameTextFieldOutlet.resignFirstResponder()
        phoneNumberTextFieldOutlet.resignFirstResponder()
        ageTextFieldOutlet.resignFirstResponder()

    }

}
