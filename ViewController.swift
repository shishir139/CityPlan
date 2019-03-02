//
//  ViewController.swift
//  CityPlan
//
//  Created by Jindal, Shishir on 6/23/17.
//  Copyright © 2017 Jindal, Shishir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  
    @IBAction func startApplication(_ sender: UIButton) {
        performSegue(withIdentifier: "cityPlan", sender: self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

