//
//  SingModul.swift
//  TSD 5.1 UIPickerView
//
//  Created by Anton Zyabkin on 03.06.2022.
//

import Foundation
import UIKit


//MARK: - functions



func gobirthdayVC (vC: UIViewController) {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let nextScreen = mainStoryboard.instantiateViewController(identifier: "BirthdayViewController") as? BirthdayViewController else {return}
    nextScreen.modalPresentationStyle = .fullScreen
    vC.show(nextScreen, sender: nil)
}
