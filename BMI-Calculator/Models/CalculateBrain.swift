//
//  CalculateBrain.swift
//  BMI-Calculator
//
//  Created by Дмитрий Яковлев on 09.02.2023.
//

import Foundation
import UIKit




struct CalculateBrain{
    
    var bmi: BMI?
    
    var advice: String?
    var color: UIColor?
    
    
    func  getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    
    mutating  func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
 
        
        switch bmiValue {
        case 0...18.5:
            print("fist")
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 18.5...24.1:
            print("second")
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        default:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
            print("third")
        }
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? ""
    }
    
    func getColor()-> UIColor {
        bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
