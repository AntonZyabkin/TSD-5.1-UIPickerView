//
//  AddingInfoViewController.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import UIKit

class AddingInfoViewController: UIViewController {
    var datePicker = UIDatePicker ()
    var malePicher = UIPickerView ()
    var agePicker = UIPickerView ()
    
    var choosedMale = ""
    var choosedAge = ""

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
        addToolBar(textField: dateOfBirthdayoutlet, function: #selector(doneActonDateTF))



        maleTextFieldOutlet.inputView = malePicher
        malePicher.tag = 0
        malePicher.dataSource = self
        malePicher.delegate = self
        addToolBar(textField: maleTextFieldOutlet, function: #selector(doneActonMaleTF))

        
        ageTextFieldOutlet.inputView = agePicker
        agePicker.tag = 1
        agePicker.dataSource = self
        agePicker.delegate = self
        addToolBar(textField: ageTextFieldOutlet, function: #selector(doneActonAgeTF))

    }
    

    func addToolBar (textField: UITextField, function: Selector) {
        let toolbar = UIToolbar ()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem (barButtonSystemItem: .done, target: self, action: function)
        let flexSpace = UIBarButtonItem (barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneActonDateTF () {
        getDateFromPicker ()
        view.endEditing(true)
    }
    
    @objc func doneActonMaleTF () {
        maleTextFieldOutlet.text = choosedMale
        view.endEditing(true)
    }
    
    @objc func doneActonAgeTF () {
        ageTextFieldOutlet.text = choosedAge
        view.endEditing(true)
    }
    
    
    func getDateFromPicker () {
        let formater = DateFormatter ()
        formater.dateFormat = "dd.mm.yyyy"
        dateOfBirthdayoutlet.text = formater.string(from: datePicker.date)
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dateOfBirthdayoutlet.resignFirstResponder()
        maleTextFieldOutlet.resignFirstResponder()
        fullNameTextFieldOutlet.resignFirstResponder()
        phoneNumberTextFieldOutlet.resignFirstResponder()
        ageTextFieldOutlet.resignFirstResponder()

    }

}


//далее просто расширяем сам вью контроллер для того чтобы он соответствовал требованиям протокола :
extension AddingInfoViewController : UIPickerViewDataSource {
    
    //ниже два обязательных метода протокола UIPickerViewDataSource
    
    //первый метод жто метод выбора количества компонентов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //второй метод определяет количество вариантов выбора для компоненотв
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return 2
        } else if pickerView.tag == 1 {
            return 100
        } else {
            return 10
        }
    }
}


//  чтобы наше вью выполняло требование протокола делегате, мы обязаны переопределить его методы согласно требования протокола


extension AddingInfoViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var result = ""
        let male = ["man", "woman"]
        if pickerView.tag == 0 {
            
            result = male[row]
            choosedMale = result
            
        } else if pickerView.tag == 1 {
            
            result = "\(row + 1)"
            choosedAge = result
            
        } else {
            
            result = "\(row)"
            
        }
        return result
    }
}


