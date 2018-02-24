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
    
}

class Calculator {
    
    var input          : Double
    var output         : Double
    var operation      : Operation
    var shouldCompound : Bool
    
    init() {
        input          = 0
        output         = 0
        operation      = .None
        shouldCompound = false
    }
    
    func receiveInput(digit: Int) {
        input = input * 10 + Double(digit)
    }
    
    func performOperation(operation: Operation) {
        
        switch operation {
        case .Addition:
            self.operation = .Addition
            output += input
            input   = 0
        case .Subtraction:
            self.operation = .Subtraction
            input  -= output
            input   = 0
        case .Multiplication:
            self.operation = .Multiplication
            output *= input
            input   = 0
        case .Division:
            self.operation = .Division
            output /= input
            input   = 0
        case .Clear:
            self.operation = .None
            input          = 0
            output         = 0
        case .Sign:
            input         *= -1
        case .Percent:
            output        /= 100
        case .Equals:
            
            switch self.operation {
                case .Addition:
                    output += input
                case .Subtraction:
                    output -= input
                case .Multiplication:
                    output *= input
                case .Division:
                    output /= input
                default:
                    return
            }
            
        default:
            return
        }
        
    }
    
}
