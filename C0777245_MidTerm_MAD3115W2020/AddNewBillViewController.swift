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
    @IBOutlet weak var iInheritanceLabel1: UILabel!
    @IBOutlet weak var iInheritanceLabel2: UILabel!
    @IBOutlet weak var iInheritanceLabel3: UILabel!
    @IBOutlet weak var iInheritanceLabel4: UILabel!
    @IBOutlet weak var iInheritanceLabel5: UILabel!
    @IBOutlet weak var iInheritanceTextField1: UITextField!
    @IBOutlet weak var iInheritanceTextField2: UITextField!
    @IBOutlet weak var iInheritanceTextField3: UITextField!
    @IBOutlet weak var iInheritanceTextField4: UITextField!
    @IBOutlet weak var iInheritanceTextField5: UITextField!
    
    var insert: [String: String] = [String: String]()
    var custId = String()
    let showBillDetailsVC: ShowBillDetailsViewController = ShowBillDetailsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.custId = ShowBillDetailsViewController.customerId ?? ""
    }
    
    @IBAction func iBillTypeSegment(_ sender: UISegmentedControl) {
        iSegmentValues(index: sender.selectedSegmentIndex)
        
    }
    
    private func iSegmentValues(index: Int){
        switch index{
        case 0:
            iBillType.text = "Mobile"
            iInheritanceLabel1.isHidden = false
            iInheritanceLabel2.isHidden = false
            iInheritanceLabel3.isHidden = false
            iInheritanceLabel4.isHidden = false
            iInheritanceLabel5.isHidden = false
            iInheritanceTextField1.isHidden = false
            iInheritanceTextField2.isHidden = false
            iInheritanceTextField3.isHidden = false
            iInheritanceTextField4.isHidden = false
            iInheritanceTextField5.isHidden = false
            iInheritanceLabel1.text = "Mobile Manufacturer:"
            iInheritanceLabel2.text = "Plan Name:"
            iInheritanceLabel3.text = "Mobile Number:"
            iInheritanceLabel4.text = "Internet GB:"
            iInheritanceLabel5.text = "Minutes:"
        case 1:
            iBillType.text = "Internet"
            iInheritanceLabel1.isHidden = false
            iInheritanceLabel2.isHidden = false
            iInheritanceLabel3.isHidden = true
            iInheritanceLabel4.isHidden = true
            iInheritanceLabel5.isHidden = true
            iInheritanceTextField1.isHidden = false
            iInheritanceTextField2.isHidden = false
            iInheritanceTextField3.isHidden = true
            iInheritanceTextField4.isHidden = true
            iInheritanceTextField5.isHidden = true
            iInheritanceLabel1.text = "Provider Name:"
            iInheritanceLabel2.text = "Internet GB:"
        case 2:
            iBillType.text = "Hydro"
            iInheritanceLabel1.isHidden = false
            iInheritanceLabel2.isHidden = false
            iInheritanceLabel3.isHidden = true
            iInheritanceLabel4.isHidden = true
            iInheritanceLabel5.isHidden = true
            iInheritanceTextField1.isHidden = false
            iInheritanceTextField2.isHidden = false
            iInheritanceTextField3.isHidden = true
            iInheritanceTextField4.isHidden = true
            iInheritanceTextField5.isHidden = true
            iInheritanceLabel1.text = "Agency Name:"
            iInheritanceLabel2.text = "Units Consumed:"
        default:
            iBillType.text = ""
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
           self.pickUpDate(self.iDateTextField)
       }

    
    @IBAction func iSaveButton(_ sender: UIBarButtonItem) {

        let billId = self.iBillId.text
        let date = self.iDateTextField.text
        let billType = self.iBillType.text
        let billAmount = self.iBillAmount.text
//        var insert: [String: String]
          guard let key = self.ref.child("Bills").childByAutoId().key else {return}

        
        if billType == "Mobile"{
            let mobileManufacturer = self.iInheritanceTextField1.text
            let planName = self.iInheritanceTextField2.text
            let mobileNumber = self.iInheritanceTextField3.text
            let internetGb = self.iInheritanceTextField4.text
            let minutes = self.iInheritanceTextField5.text
            self.insert = ["custId": self.custId, "id": billId ?? "", "date": date ?? "", "billType": billType ?? "", "billAmount": billAmount ?? "", "mobileManufacturer": mobileManufacturer ?? "", "planName": planName ?? "", "mobileNumber": mobileNumber ?? "", "internetGb": internetGb ?? "", "minutes": minutes ?? ""]
              
          } else if billType == "Internet"{
            let providerName = self.iInheritanceTextField1.text
            let internetGb = self.iInheritanceTextField2.text
            self.insert = ["custId": self.custId, "id": billId ?? "", "date": date ?? "", "billType": billType ?? "", "billAmount": billAmount ?? "", "providerName": providerName ?? "", "internetGb": internetGb ?? ""]
          }
          else if billType == "Hydro"{
            let agencyName = self.iInheritanceTextField1.text
            let unitsConsumed = self.iInheritanceTextField2.text
             self.insert = ["custId": self.custId, "id": billId ?? "", "date": date ?? "", "billType": billType ?? "", "billAmount": billAmount ?? "", "agencyName": agencyName ?? "", "unitsConsumed": unitsConsumed ?? ""]
          }
          else{
            self.insert = ["custId": self.custId, "id": billId ?? "", "date": date ?? "", "billType": billType ?? "", "billAmount": billAmount ?? ""]
          }
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
