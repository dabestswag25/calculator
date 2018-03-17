//
//  ViewController.swift
//  calculator
//
//  Created by UCode on 2/9/18.
//  Copyright © 2018 Preston Tran. All rights reserved.
//

import UIKit

enum NumberShown {
    
    case Input
    case Output
    
}

class ViewController: UIViewController {

    let calculator: Calculator = Calculator()
    

    @IBAction func clearDisplay(_ sender: UIButton) {
        calculator.performOperation(operation: .Clear)
        showInput()
    }
    @IBAction func sign(_ sender: UIButton) {
        calculator.performOperation(operation: .Sign)
        showInput()
    }
    @IBAction func percent(_ sender: UIButton) {
        calculator.performOperation(operation: .Percent)
        showInput()
    }
    @IBAction func divide(_ sender: UIButton) {
        calculator.performOperation(operation: .Division)
        showOutput()
    }
    @IBAction func digitPress(_ sender: UIButton) {
        calculator.receiveInput(digit: sender.tag)
        showInput()
    }
    @IBAction func multiply(_ sender: UIButton) {
        calculator.performOperation(operation: .Multiplication)
        showOutput()
    }
    @IBAction func subtract(_ sender: UIButton) {
        calculator.performOperation(operation: .Subtraction)
        showOutput()
    }
    @IBAction func add(_ sender: UIButton) {
        calculator.performOperation(operation: .Addition)
        showOutput()
    }
    @IBAction func equalTo(_ sender: UIButton) {
        calculator.performOperation(operation: .Equals)
        showOutput()
    }
    @IBAction func decimal(_ sender: UIButton) {
        calculator.performOperation(operation: .Decimal)
    }
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showInput()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInput() {
        displayLabel.text = String(calculator.input)
    }
    
    func showOutput() {
        displayLabel.text = String(calculator.output)
    }


}

