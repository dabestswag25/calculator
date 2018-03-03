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
    var initialInput   : Bool
    var isEqual        : Bool
    
    init() {
        input          = 0
        output         = 0
        operation      = .None
        initialInput   = true
        isEqual        = false
    }
    
    func receiveInput(digit: Int) {
        if isEqual {
            input        = 0
            output       = 0
            operation    = .None
            initialInput = true
            isEqual      = false
        }
        input = input * 10 + Double(digit)
    }
    
    func performOperation(operation: Operation) {
        
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
            
            print(self.operation)
            
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
            
            
            
        default:
            return
        }
        
    }
    
}
