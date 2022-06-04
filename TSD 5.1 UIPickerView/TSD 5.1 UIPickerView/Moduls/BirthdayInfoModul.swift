//
//  BirthdayInfoModul.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func createCustomNavifationBar () {
        navigationController?.navigationBar.barTintColor = .white
    }
    
    
    //функция создает кастомную кнопку и возвращает занчение UIBarButtonItem которое потом можно добавить с навигейшб бар
    func createCustomButton (imageName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton (type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.tintColor = .systemPink
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        
        let menuBarItemButton = UIBarButtonItem (customView: button)
        return menuBarItemButton
    }
}

func goAdiingVC (vC: UIViewController) {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let nextScreen = mainStoryboard.instantiateViewController(identifier: "AddingInfoViewController") as? AddingInfoViewController else {return}
    nextScreen.modalPresentationStyle = .fullScreen
    vC.show(nextScreen, sender: nil)
}

