//
//  EnterTimeViewController.swift
//  RedmineTimer
//
//  Created by karim on 21/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import UIKit

class EnterTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    //MARK: Properties
    var activities = [String: Int]()
    var pickerData = [String]()
    var selectedValue = String()
    @IBOutlet weak var timeEdit: UITextField!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var activityPicker: UIPickerView!
    
    //MARK: Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        initActivities()
        activityPicker.delegate = self
        self.activityPicker.dataSource = self
    }

    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        self.selectedValue = pickerData[activityPicker.selectedRow(inComponent: component)]
    }
    
    //MARK: UIPickerViewDataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Actions
    @IBAction func onApplyClick(_ sender: UIButton) {
        //let activityId = activities[pickerData[activityPicker.]]
        
    }
    
    
    // MARK: - Navigation
     @IBAction func cancel(_ sender: UIBarButtonItem) {
     dismiss(animated: true, completion: nil)
        
     }
     
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    private func initActivities() {
        activities["Développement"] = 9
        activities["Suivi de projet"] = 37
        activities["Déploiement"] = 10
        activities["Études"] = 8
        activities["Tests / Recette"] = 14
        activities["Conception technique"] = 34
        for (key, _) in activities {
            pickerData += [key]
        }
    }
}
