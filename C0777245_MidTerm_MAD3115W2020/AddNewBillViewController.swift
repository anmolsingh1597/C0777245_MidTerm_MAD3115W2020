//
//  AddNewBillViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-10.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class AddNewBillViewController: UIViewController, UITextFieldDelegate
{
    var ref = Database.database().reference()
    var datePicker : UIDatePicker!
    @IBOutlet weak var iDateTextField: UITextField!
    @IBOutlet weak var iBillId: UITextField!
    @IBOutlet weak var iBillType: UITextField!
    @IBOutlet weak var iBillAmount: UITextField!
    var custId = String()
    let showBillDetailsVC: ShowBillDetailsViewController = ShowBillDetailsViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let showBillDetailsVC: ShowBillDetailsViewController = sb.instantiateViewController(withIdentifier: "showBillDetailsVC") as! ShowBillDetailsViewController
        self.custId = ShowBillDetailsViewController.customerId ?? ""
    }
//    override func didReceiveMemoryWarning() {
//         super.didReceiveMemoryWarning()
//         // Dispose of any resources that can be recreated.
//     }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           self.pickUpDate(self.iDateTextField)
       }

    
    @IBAction func iSaveButton(_ sender: UIBarButtonItem) {

        let billId = self.iBillId.text
        let date = self.iDateTextField.text
        let billType = self.iBillType.text
        let billAmount = self.iBillAmount.text
          guard let key = self.ref.child("Bills").childByAutoId().key else {return}
        let insert = ["custId": self.custId, "id": billId, "date": date, "billType": billType, "billAmount": billAmount]
        if billId == "" || date == "" || billType == "" || billAmount == ""
                       {
                          
                           let alertControll = UIAlertController(title: "Error!", message: "All fields are required", preferredStyle: .alert)
                                      alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                                      self.present(alertControll, animated: true, completion: nil)
                       }
        else{
            let childUpdates = ["/Bills/\(key)": insert]
                              self.ref.updateChildValues(childUpdates)
            DataStorage.getInstance().addBill(bill: Bill.init(custId: self.custId, billId: billId ?? "", billDate: date ?? "", billType: billType ?? "", billAmount: billAmount ?? ""))
            let sb = UIStoryboard(name: "Main", bundle: nil)
                           let showBillDetailsVC = sb.instantiateViewController(identifier: "showBillDetailsVC") as! ShowBillDetailsViewController
                           self.navigationController?.pushViewController(showBillDetailsVC, animated: true)
        }
        
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
