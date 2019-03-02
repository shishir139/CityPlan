//
//  ThirdViewController.swift
//  CityPlan
//
//  Created by Jindal, Shishir on 6/23/17.
//  Copyright © 2017 Jindal, Shishir. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController {
    var locationX : Int = 0
    var locationY : Int = 0
    var oldValueXXA :String = "1"
    var oldValueYYA :String = "1"
    var oldValueXXB :String = "1"
    var oldValueYYB :String = "1"
    var oldValueXXC :String = "1"
    var oldValueYYC :String = "1"
    var oldValueXXD :String = "1"
    var oldValueYYD :String = "1"
    var oldPopulationAA:String = "1000"
    var oldPopulationBB:String = "1000"
    var oldPopulationCC: String = "1000"
    var oldPopulationDD:String = "1000"
    
    
    
   
    @IBOutlet weak var img: UIImageView!

    @IBOutlet var grid: UIView!
    @IBOutlet weak var label: UILabel!
   
   
    @IBAction func back(_ sender: UIButton) {
        performSegue(withIdentifier: "back", sender: self)
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var secondView : SecondViewController = segue.destination as! SecondViewController
        secondView.oldValueXA = oldValueXXA
        secondView.oldValueYA = oldValueYYA
        secondView.oldValueXB = oldValueXXB
        secondView.oldValueYB = oldValueYYB
        secondView.oldValueXC = oldValueXXC
        secondView.oldValueYC = oldValueYYC
        secondView.oldValueXD = oldValueXXD
        secondView.oldValueYD = oldValueYYD
        secondView.oldPopulationA = oldPopulationAA
        secondView.oldPopulationB = oldPopulationBB
        secondView.oldPopulationC = oldPopulationCC
        secondView.oldPopulationD = oldPopulationDD
        secondView.locationX = locationX
        secondView.locationY = locationY
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //img.isHidden = true
        img.isHidden = false
        
        label.text = " The unhappiness is \(message) and the location of the garbage facility is (\(locationX) , \(locationY))"
        img.image = UIImage(named: "facility.jpg")
        img.center = CGPoint(x : (((locationX * 10) - 5) + 70), y : (((locationY * 10) - 5) + 10))

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
