//
//  CalculatorViewController.swift
//
//
//  Created by Jagtar Singh matharu on 2022-10-15.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var outputLbl: UILabel!
    
    //MARK: - Variables
    var numberOnScreen: Double = 0.0 //current number on screen
    
    var previousNumber: Double = 0.0 //save the previously entered number
    
    var performingMath = false //the state of when an operator has already been pressed
    
    var operation = 0 //this will be the current operation we are using
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    //When we press a number on the calculator
    @IBAction func numberBtn(_ sender: UIButton) {
        
        
        //AudioServicesPlaySystemSound(0x450)
        
      
        
        if performingMath == true {
            //if we are currently performing math
            outputLbl.text = "" //clear the label on the calculator
            outputLbl.text = String(sender.tag) //make the next number show
            
            //once the second number has been pressed
            numberOnScreen = Double(outputLbl.text!)!
            
            performingMath = false //once number has been pressed, we can select another button
        } else {
            //if we are NOT currently performing math
            //operation has not been selected
            outputLbl.text = outputLbl.text! + String(sender.tag) //append numbers to screen
            numberOnScreen = Double(outputLbl.text!)! //set the current number pressed
        }
    }
    
    //When we press an operator on the calculator
    @IBAction func operators(_ sender: UIButton) {
        
        //11 - equals
        //10 - clear
        //12 - add
        //13 - subtract
        //14 - div
        //15 - multiply
       
        //update the text if an operator was selected
        if(outputLbl.text != "" && sender.tag != 11 && sender.tag != 10) {
            //if the label is not empty, and equals or clear have not been selected
            //save the previous number after operator has been selected
            previousNumber = Double(outputLbl.text!)!
            
            if sender.tag == 12 {
                //add
                outputLbl.text = "+"
            } else if sender.tag == 13 {
                //subtract
                outputLbl.text = "-"
            } else if sender.tag == 14 {
                //div
                outputLbl.text = "/"
            } else if sender.tag == 15 {
                //mul
                outputLbl.text = "*"
            }else if sender.tag == 16 {
                //mul
                outputLbl.text = "%"
            }
            
            operation = sender.tag //we will know which operator has been selected
            
            performingMath = true //operator has been pressed
        } else if sender.tag == 11 {
            //equals button
            
            if operation == 12 {
                //adding
                outputLbl.text = String(previousNumber + numberOnScreen)
            } else if operation == 13 {
                //subtracting
                outputLbl.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                //dividing
                outputLbl.text = String(previousNumber / numberOnScreen)
            } else if operation == 15 {
                //multiply
                outputLbl.text = String(previousNumber * numberOnScreen)
            }else if operation == 16 {
                //mod
                outputLbl.text = String(Int(previousNumber) % Int(numberOnScreen))
            }
            
            
        } else if sender.tag == 10 {
            //clear button - reset everything
            outputLbl.text = ""
            previousNumber = 0.0
            numberOnScreen = 0.0
        }
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//  ViewController.swift
//  Calculator
//
//  Created by Mark-Anthony Octavius Meritt on 2022-09-23.
//
