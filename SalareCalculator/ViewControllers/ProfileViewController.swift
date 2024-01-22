//
//  ProfileViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 22.01.2024.
//

import Foundation
import UIKit

protocol ProfileViewControllerDelegate {
    func returnSaveName() -> User
    func returnSaveRate() -> String
}

class ProfileViewController: UIViewController, ChengeNameViewControllerDelegate2, ChengeRateViewControllerDelegate2 {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var surNameLable: UILabel!
    @IBOutlet weak var rateLable: UILabel!
    
    var user: User?
    var rate: String?
    
    var delegate: ProfileViewControllerDelegate?
    let savingService = SavingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = savingService
        
        accept()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChengeName" {
            let destinationVC = segue.destination as! ChengeNameViewController
            destinationVC.delegate2 = self
        }
        
        if segue.identifier == "goToChengeRate" {
            let destinationVC = segue.destination as! ChengeRateViewController
            destinationVC.delegate2 = self
        }
    }

    
    func accept() {
        
        if let savedName = delegate?.returnSaveName() {
            self.user = savedName
        }
        
        if let savedRate = delegate?.returnSaveRate() {
            self.rate = savedRate
        }
        
        nameLable.text = user?.name
        surNameLable.text = user?.surname
        if let rate = rate {
            rateLable.text = "\(rate) рублей/час"
        }
    }
    
    @IBAction func backButtonOnProfileTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
}
