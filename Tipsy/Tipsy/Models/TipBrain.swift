//
//  TipBrain.swift
//  Tipsy
//
//  Created by niBVL on 12/10/2021.
//

import Foundation

class TipBrain {
    var tip = Tip(billValue: 0.0, tipValue: 10.0, splitValue: 2.0)
    var value: Float
    
    init() {
        self.value = 0.0
    }
    
    func getSplitText() -> String {
        return String(format: "%.0f", tip.splitValue)
    }
    
    func  getTipText() -> String {
        return "Split between \(Int(tip.splitValue)) people, with \(Int(tip.tipValue))% tip."
    }
    
    func getCalculator() -> String {
        return String(format: "%.1f", value)
    }
    
     func setBillValue(bill: String)  {
        tip.billValue = Float(bill) ?? 0.0
    }
    
     func setTipValue(tipString: String)  {
        tip.tipValue = Float(tipString.dropLast()) ?? 0.0
    }
    
     func setSplitValue(splitValue: Float)  {
        tip.splitValue = splitValue
    }
    
     func calculatorTip()  {
        value = tip.billValue * (1 + tip.tipValue / 100) / tip.splitValue
    }
    

    
    
}
