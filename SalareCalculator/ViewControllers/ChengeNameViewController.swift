//
//  ChengeNameViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 22.01.2024.
//

import Foundation
import UIKit

protocol ChengeNameViewControllerDelegate {
    func saveName(user: User)
}

protocol ChengeNameViewControllerDelegate2 {
    func accept()
}

class ChengeNameViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    
    var delegate: ChengeNameViewControllerDelegate?
    var delegate2: ChengeNameViewControllerDelegate2?
    let savingService = SavingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.delegate = savingService
    }
    
    @IBAction func saveNameButtonTap(_ sender: Any) {
        
        let user = User(name: nameTextField.text ?? "Без имени", surname: surNameTextField.text ?? "Без имени")
        
        delegate?.saveName(user: user)
        
        delegate2?.accept()
        navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnChengeNameTap(_ sender: Any) {
        
        delegate2?.accept()
        navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)

    }
}
