//
//  CalculatorBrain.swift
//  BMI
//
//  Created by niBVL on 11/10/2021.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi  = BMI(value: 0.0, advise: "", color: .blue)
    
    
    
    
    mutating func calculatorBMI(height: Float, weight: Float)   {
       let bmiValue = weight / (height * height)
        bmi.value = bmiValue
        if bmiValue < 18.5 {
            bmi.advise = "Underweight"
            bmi.color = UIColor.green
        }
        else if bmiValue >= 25 {
            bmi.advise = "Overweight"
            bmi.color = UIColor.red
        }
        else {
            bmi.advise = "Normalweight"
            bmi.color = UIColor.orange
        }
        
       
    }
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmi.value)
    }
    
    func getAdvise() -> String {
        return bmi.advise
    }
    
    func getColor() -> UIColor {
        return bmi.color
    }
    
}
