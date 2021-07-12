//
//  AddItemsVC.swift
//  List Of Plan
//
//  Created by admin on 20.11.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class AddItemsVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var addBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newItemTextField.delegate = self
        setUpUI()
        setUpDate()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
        
    @IBAction func addItemBtn(_ sender: Any) {
        
        if let newItemName = newItemTextField.text, !newItemName.isEmpty {
            let newItemdate = datePicker.date
            
            realm.beginWrite()
            let newItem = Items()
            newItem.name = newItemName
            newItem.date = newItemdate
            newItem.completed = false
            setNotification(item: newItem)
            realm.add(newItem)
            try! realm.commitWrite()
        }
    }
    
    func setUpUI(){
        titleLabel.layer.masksToBounds = true
        newItemTextField.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 4
        newItemTextField.layer.cornerRadius = 4
        addBTN.layer.cornerRadius = 4
        cancelBTN.layer.cornerRadius = 4
        newItemTextField.becomeFirstResponder()
    }
    
    func setUpDate(){
        let date = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker.minimumDate = date
        datePicker.preferredDatePickerStyle = .wheels
    }
}
