//
//  ViewController.swift
//  axel_Denhaut_first_swift_app
//
//  Created by DENHAUT Axel on 31/03/2017.
//  Copyright © 2017 DENHAUT Axel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerInfo: [String] = ["oeufs durs", "Oeuf à la coque", "oeuf mollet", "Oeuf cocotte", "Oeuf poché", "Omelette Baveuse"]
    
    // Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var eggPicker: UIPickerView!
    @IBOutlet weak var minuteurStartBtn: UIButton!
    
    // Actions
    
    
    @IBAction func minuteurStartAction(_ sender: UIButton) {
        
    }
    
    @IBAction func minuteurResetAction(_ sender: UIButton) {
    }
   
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eggPicker.delegate = self
        eggPicker.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // mark - UIPickerViewDelegateInfo
    
    // Return the nupmber of column to display
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    // returns the # of rows in each component..
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerInfo[row]
    }
    
    // num de la ligne en retour
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("You have selected : \(row)")
    }

}

