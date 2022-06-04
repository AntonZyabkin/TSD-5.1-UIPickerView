//
//  ViewController.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import UIKit

class BirthdayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Birthday information"
        setupViews ()
    }


    private func setupViews () {
        createCustomNavifationBar()
        
        //создаем кастомную кнопку с помощью функции createCustomButton
        let plusRightButton = createCustomButton(
            imageName: "plus",
            selector: #selector(plusRightButtonTapped))
        
        // добавляем кастомную кнопку на навигейшн бар
        navigationItem.rightBarButtonItem = plusRightButton
    }
    
    //назначаем функцию которая вызывается после нажатия на кнопку ПЛЮС в навигейшн баре
    @objc private func plusRightButtonTapped () {
        goAdiingVC (vC: self)
    }
}

