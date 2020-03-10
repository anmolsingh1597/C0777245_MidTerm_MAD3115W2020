//
//  AddNewBillViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-10.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController, UITextFieldDelegate
{
    var datePicker : UIDatePicker!
    @IBOutlet weak var iDateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           self.pickUpDate(self.iDateTextField)
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddNewBillViewController
{
    func pickUpDate(_ textField : UITextField){
          
          // DatePicker
          self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
          self.datePicker.backgroundColor = UIColor.white
          self.datePicker.datePickerMode = UIDatePicker.Mode.date
          textField.inputView = self.datePicker
          
          // ToolBar
          let toolBar = UIToolbar()
          toolBar.barStyle = .default
          toolBar.isTranslucent = true
          toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
          toolBar.sizeToFit()
          
          // Adding Button ToolBar
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewBillViewController.doneClick))
          let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewBillViewController.cancelClick))
          toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
          toolBar.isUserInteractionEnabled = true
          textField.inputAccessoryView = toolBar
          
      }
      
      @objc func doneClick() {
          let dateFormatter1 = DateFormatter()
          dateFormatter1.dateStyle = .medium
          dateFormatter1.timeStyle = .none
          iDateTextField.text = dateFormatter1.string(from: datePicker.date)
          iDateTextField.resignFirstResponder()
      }
      
      @objc func cancelClick() {
          iDateTextField.resignFirstResponder()
      }
}
