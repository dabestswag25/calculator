//
//  Calculator.swift
//  calculator
//
//  Created by UCode on 2/16/18.
//  Copyright © 2018 Preston Tran. All rights reserved.
//

import Foundation

enum Operation {
    
    case None
    case Addition
    case Subtraction
    case Multiplication
    case Division
    case Equals
    case Clear
    case Sign
    case Percent
    case Decimal
    
}

class Calculator {
    
    var input          : Double
    var output         : Double
    var operation      : Operation
    var initialInput   : Bool
    var isEqual        : Bool
    var decimalPlace   : Int
    
    init() {
        input          = 0
        output         = 0
        operation      = .None
        initialInput   = true
        isEqual        = false
        decimalPlace   = 0
    }
    
    func receiveInput(digit: Int) {
        if isEqual {
            input        = 0
            output       = 0
            operation    = .None
            initialInput = true
            isEqual      = false
        }
        if decimalPlace >= 0 {
            input = input * 10 + Double(digit)
        }
        else if decimalPlace < 0 {
            input = input + Double(digit) * pow(10.0, Double(decimalPlace))
            decimalPlace -= 1
        }
    }
    
    func performOperation(operation: Operation) {
        
        if operation != .Decimal {
            decimalPlace = 0
        }
        
        switch operation {
        case .Addition:
            self.operation = .Addition
            if initialInput {
                output = input
                initialInput = false
            }
            
            else {
                output += input
            }
            input   = 0
        case .Subtraction:
            self.operation = .Subtraction
            if initialInput {
                output = input
                initialInput = false
            }
            else {
                output -= input
            }
            input   = 0
        case .Multiplication:
            self.operation = .Multiplication
            if initialInput {
                output = input
                initialInput = false
            }
            else {
                output *= input
            }
            input   = 0
        case .Division:
            self.operation = .Division
            if initialInput {
                output = input
                initialInput = false
            }
            else {
                output /= input
            }
            input   = 0
        case .Clear:
            self.operation = .None
            input          = 0
            output         = 0
            initialInput   = true
            isEqual        = false
        case .Sign:
            input         *= -1
        case .Percent:
            input         /= 100
        case .Equals:
            
            switch self.operation {
                case .Addition:
                    output += input
                    isEqual = true
                case .Subtraction:
                    output -= input
                    isEqual = true
                case .Multiplication:
                    output *= input
                    isEqual = true
                case .Division:
                    output /= input
                    isEqual = true
                default:
                    return
                
            }
        case .Decimal:
            if decimalPlace == 0 {
                decimalPlace -= 1
            }
        default:
            return
        }
        
    }
    
}
