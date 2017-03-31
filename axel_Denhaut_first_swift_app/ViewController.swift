//
//  ViewController.swift
//  axel_Denhaut_first_swift_app
//
//  Created by DENHAUT Axel on 31/03/2017.
//  Copyright © 2017 DENHAUT Axel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerInfo: [String] = ["oeufs durs", "Oeuf à la coque", "oeuf mollet", "Oeuf cocotte", "Oeuf poché", "Omelette Baveuse"]
    var cookingTime: [Int] = [3, 180, 360, 180, 240, 300]
    var cookTime: Int = 0
    var timer:Timer = Timer()
    var isActive:Bool = false
    var player: AVAudioPlayer = AVAudioPlayer()
    
    // Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var eggPicker: UIPickerView!
    @IBOutlet weak var minuteurStartBtn: UIButton!
    
    // Actions
    
    
    @IBAction func minuteurStartAction(_ sender: UIButton) {
        timerr()
    }
    
    @IBAction func minuteurResetAction(_ sender: UIButton) {
        resetTimer()
    }
   
    
    func selectionCookingTime(Selection: Int){
        minuteurStartBtn.isEnabled = true
        minuteurLabel.textColor = UIColor.black
        minuteurStartBtn.alpha = 1
        cookTime = cookingTime[Selection]
        minuteurLabel.text = minuteurString(time: cookTime)
    }
    
    func minuteurString(time: Int) ->String{
        let heure = Int(time/3600)
        let minute = Int(time/60 % 60)
        let second = Int(time % 60)
        return String(format: "%02i:%02i:%02i", heure, minute, second)
    }
    
    // because the keyword timer is already taken
    func timerr(){
        if !isActive {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.increment), userInfo: nil, repeats: true)
            isActive = true
            minuteurStartBtn.setTitle("STOP", for: UIControlState.normal)
            minuteurStartBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        }else{
            timer.invalidate()
            isActive = false
            minuteurStartBtn.setTitle("Start", for: UIControlState.normal)
            minuteurStartBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        }
        
    }
    
    func resetTimer(){
        timer.invalidate()
        cookTime = 0
        isActive = false
        minuteurLabel.text = "00:00:00"
        minuteurStartBtn.setTitle("Start", for: UIControlState.normal)
        minuteurStartBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        minuteurStartBtn.isEnabled = false
        minuteurStartBtn.alpha = 0.3
        eggPicker.selectRow(0, inComponent: 0, animated: true)

    }
    
    func increment(){
        if(cookTime == 0){
            timer.invalidate()
            minuteurLabel.text = ("00:00:00")
            minuteurStartBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            minuteurStartBtn.isEnabled = false
            minuteurLabel.textColor = UIColor.green
            player.play()
        }else{
            cookTime -= 1
            minuteurLabel.text = minuteurString(time: cookTime)
        }
    }
    
    func alarm(){
        let file = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        do{
            try player = AVAudioPlayer(contentsOf: URL(string: file!)!)
        }catch{
            print("ERROR")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       minuteurStartBtn.isEnabled = false
        minuteurStartBtn.alpha = 0.3
        
        alarm() //activate the alarm
        
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
        selectionCookingTime(Selection: row)
    }

}

