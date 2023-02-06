//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Дмитрий Яковлев on 06.02.2023.
//

import UIKit

class CalculateViewController: UIViewController {

    
    var calculateBrain = CalculateBrain()
  
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start")
        
      
    }

    @IBAction func heightSliderAction(_ sender: UISlider) {
        
       let heigh = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heigh)m"
    }
    
    @IBAction func weightSliderAction(_ sender: UISlider) {
        
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculateBrain.calculateBMI(height: height, weight: weight)
     
         
        performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
            
        }
    }
    
}

