//
//  SecondViewController.swift
//  CityPlan
//
//  Created by Jindal, Shishir on 6/23/17.
//  Copyright © 2017 Jindal, Shishir. All rights reserved.
//

import UIKit
var message:String = ""



class SecondViewController: UIViewController {
    
    var citymodel : CityModel!
    
    var valueOfXA:Int = 1
    var valueOfYA:Int = 1
    var valueOfXB:Int = 1
    var valueOfYB:Int = 1
    var valueOfXC:Int = 1
    var valueOfYC:Int = 1
    var valueOfXD:Int = 1
    var valueOfYD:Int = 1
    
    var locationX:Int = 0
    var locationY:Int = 0
    
    var populationOfA:Int = 1000
    var populationOfB:Int = 1000
    var populationOfC:Int = 1000
    var populationOfD:Int = 1000
    
  
    var oldValueXA :String = "1"
    var oldValueYA :String = "1"
    var oldValueXB :String = "1"
    var oldValueYB :String = "1"
    var oldValueXC :String = "1"
    var oldValueYC :String = "1"
    var oldValueXD :String = "1"
    var oldValueYD :String = "1"
    var oldPopulationA:String = "1000"
    var oldPopulationB:String = "1000"
    var oldPopulationC: String = "1000"
    var oldPopulationD:String = "1000"
    
    var unhappiness:Float = 100000000000
   
    
    
    
    @IBOutlet weak var xCityA: UITextField!
    @IBOutlet weak var yCityA: UITextField!
    @IBOutlet weak var populationA: UITextField!
  @IBOutlet weak var yCityB: UITextField!
    @IBOutlet weak var XCityB: UITextField!
 @IBOutlet weak var populationB: UITextField!
    
    @IBOutlet weak var populationC: UITextField!
    @IBOutlet weak var yCityC: UITextField!
    @IBOutlet weak var xCityC: UITextField!
    @IBOutlet weak var xCityD: UITextField!
    
    @IBOutlet weak var yCityD: UITextField!
    @IBOutlet weak var populationD: UITextField!
    
    
    
    
    @IBAction func stepperXA(_ sender: UIStepper) {
        valueOfXA = Int(sender.value)
    xCityA.text = String(valueOfXA)
    }
    @IBAction func stepperYA(_ sender: UIStepper) {
        valueOfYA = Int(sender.value)
        yCityA.text = String(valueOfYA)
    }
    @IBAction func stepperXB(_ sender: UIStepper) {
        valueOfXB = Int(sender.value)
        XCityB.text = String(valueOfXB)
    }
    
    @IBAction func stepperYB(_ sender: UIStepper) {
        valueOfYB = Int(sender.value)
        yCityB.text = String(valueOfYB)
    }
    @IBAction func stepperXC(_ sender: UIStepper) {
        valueOfXC = Int(sender.value)
        xCityC.text = String(valueOfXC)
    }
    @IBAction func stepperYC(_ sender: UIStepper) {
        valueOfYC = Int(sender.value)
        yCityC.text = String(valueOfYC)
    }
    @IBAction func stepperXD(_ sender: UIStepper) {
        valueOfXD = Int(sender.value)
        xCityD.text = String(valueOfXD)
    }
    @IBAction func stepperYD(_ sender: UIStepper) {
        valueOfYD = Int(sender.value)
        yCityD.text = String(valueOfYD)
    }
    
    @IBAction func sliderAChanger(_ sender: UISlider) {
populationOfA = Int(sender.value)
        populationOfA = populationOfA * 1000
        populationA.text = String(populationOfA)
    }
    @IBAction func sliderBChanger(_ sender: UISlider) {
      
        populationOfB = Int(sender.value)
        populationOfB = populationOfB * 1000
        populationB.text = String(populationOfB)
    }
    @IBAction func sliderCChanger(_ sender: UISlider) {
        populationOfC = Int(sender.value)
        populationOfC = populationOfC * 1000
        populationC.text = String(populationOfC)
    }
    @IBAction func sliderDChanger(_ sender: UISlider) {
        populationOfD = Int(sender.value)
        populationOfD = populationOfD * 1000
        populationD.text = String(populationOfD)
    }
    @IBAction func computePlan(_ sender: UIButton) {
        var avgU:Float = 0
        for i in 1...25 {
        for j in 1...25 {
        var distanceFromA:Float = sqrtf(powf(Float(valueOfXA - i), 2)) + sqrtf(powf(Float(valueOfYA - j), 2))
        var distanceFromB:Float = sqrtf(powf(Float(valueOfXB - i), 2)) + sqrtf(powf(Float(valueOfYB - j), 2))
        var distanceFromC:Float = sqrtf(powf(Float(valueOfXC - i), 2)) + sqrtf(powf(Float(valueOfYC - j), 2))
         var distanceFromD:Float = sqrtf(powf(Float(valueOfXD - i), 2)) + sqrtf(powf(Float(valueOfYD - j), 2))
           
            var unhappinessA:Float
            var unhappinessB:Float
            var unhappinessC:Float
            var unhappinessD:Float
            
            if distanceFromA <= 2  {
                unhappinessA = 200000000000
            }
            else {
            unhappinessA = Float(populationOfA) / distanceFromA
            }
            if distanceFromB <= 2 {
                unhappinessB = 200000000000
            } else {
                unhappinessB = Float(populationOfB) / distanceFromB
            }
            if distanceFromC <= 2 {
               unhappinessC = 200000000000
            }
            else {
            
            unhappinessC = Float(populationOfC) / distanceFromC
            }
            if distanceFromD <= 2 {
                unhappinessD = 200000000000
            }
            else {
            unhappinessD = Float(populationOfD) / distanceFromD
            }
            
            citymodel = CityModel(unhappinessA, unhappinessB, unhappinessC, unhappinessD, populationOfA, populationOfB, populationOfC, populationOfD)
            
        citymodel.totalHappinessAndPoupulation()
            avgU = citymodel.avgUnhappinessCalc()
            
            
            if avgU < unhappiness  {
                unhappiness = avgU
                locationX = i
                locationY = j
            }
        
        
            
            }
        }
        
  
      message = String(avgU)
        
    performSegue(withIdentifier: "showPlan", sender: self)
       
        
    }
 
    @IBAction func resetButton(_ sender: UIButton) {
        xCityA.text = "1"
        yCityA.text = "1"
        XCityB.text = "1"
        yCityB.text = "1"
        xCityC.text = "1"
        yCityC.text = "1"
        xCityD.text = "1"
        yCityD.text = "1"
        populationA.text = "1000"
        populationB.text = "1000"
        populationC.text = "1000"
        populationD.text = "1000"
        
        valueOfXA = 1
        valueOfYA = 1
        valueOfXB = 1
        valueOfYB = 1
        valueOfXC = 1
        valueOfYC = 1
        valueOfXD = 1
        valueOfYD = 1
        populationOfA = 1000
        populationOfB = 1000
        populationOfC = 1000
        populationOfD = 1000
        locationX = 0
        locationY = 0
        message = " "
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var mainView : ThirdViewController = segue.destination as! ThirdViewController
        mainView.locationX = locationX
        mainView.locationY = locationY
        mainView.oldValueXXA = xCityA.text!
        mainView.oldValueYYA = yCityA.text!
        mainView.oldValueXXB = XCityB.text!
        mainView.oldValueYYB = yCityB.text!
        mainView.oldValueXXC = xCityC.text!
        mainView.oldValueYYC = yCityC.text!
        mainView.oldValueXXD = xCityD.text!
        mainView.oldValueYYD = yCityD.text!
        mainView.oldPopulationAA = populationA.text!
        mainView.oldPopulationBB = populationB.text!
        mainView.oldPopulationCC = populationC.text!
        mainView.oldPopulationDD = populationD.text!
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       xCityA.text = oldValueXA
        yCityA.text = oldValueYA
        XCityB.text = oldValueXB
        yCityB.text = oldValueYB
        xCityC.text = oldValueXC
        yCityC.text = oldValueYC
        xCityD.text = oldValueXD
        yCityD.text = oldValueYD
        populationA.text = oldPopulationA
        populationB.text = oldPopulationB
        populationC.text = oldPopulationC
        populationD.text = oldPopulationD
        
        valueOfXA = Int(oldValueXA)!
        valueOfYA = Int(oldValueYA)!
        valueOfXB = Int(oldValueXB)!
        valueOfYB = Int(oldValueYB)!
        valueOfXC = Int(oldValueXC)!
        valueOfYC = Int(oldValueYC)!
        valueOfXD = Int(oldValueXD)!
        valueOfYD = Int(oldValueYD)!
        populationOfA = Int(oldPopulationA)!
        populationOfB = Int(oldPopulationB)!
        populationOfC = Int(oldPopulationC)!
        populationOfD = Int(oldPopulationD)!
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
