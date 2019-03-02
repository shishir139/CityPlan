//
//  CityModel.swift
//  CityPlan
//
//  Created by Jindal, Shishir on 6/26/17.
//  Copyright © 2017 Jindal, Shishir. All rights reserved.
//

import Foundation

class CityModel {
    
    var unhappinessA:Float
    var unhappinessB:Float
    var unhappinessC:Float
    var unhappinessD:Float
    
    var populationOfA:Int
    var populationOfB:Int
    var populationOfC:Int
    var populationOfD:Int
    
    var totalUnhappiness:Float = 0
    var totalPopulation:Int = 0
    
    var avgUnhappiness: Float = 0
    
    init(_ uA: Float, _ uB: Float, _ uC: Float, _ uD: Float, _ pA: Int, _ pB: Int, _ pC: Int, _ pD: Int) {
        unhappinessA = uA
        unhappinessB = uB
        unhappinessC = uC
        unhappinessD = uD
        populationOfA = pA
        populationOfB = pB
        populationOfC = pC
        populationOfD = pD
    }
    
    func totalHappinessAndPoupulation() {
        totalUnhappiness = unhappinessA + unhappinessB + unhappinessC + unhappinessD
       totalPopulation = populationOfA + populationOfB + populationOfC + populationOfD
        
    }
    
    func avgUnhappinessCalc() -> Float {
        avgUnhappiness = totalUnhappiness / Float(totalPopulation)
        return avgUnhappiness
        
    }
    
    
}
