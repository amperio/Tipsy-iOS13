//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Juan Navarro  on 2/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
struct CalculateBrain {
    
    var porcentajePropina: String?
    var resultModel: ResultModel?
    
    // totalPerPerson | numPersonas | porcentajePropina |totalBill
    mutating func calculate(numPersonas: Int,totalBill: Double) {
        let v = Int(porcentajePropina!)
        let totalBillTip = totalBill + (totalBill * (Double(v!)/100))
        let totalPerPerson = totalBillTip / Double(numPersonas)
        resultModel = ResultModel(totalPerPerson: totalPerPerson, numPersonas: numPersonas, porcentajePropina: v!, totalBill: totalBill)
    }
    
    func getporcentajePropina() -> Int {
        return resultModel?.porcentajePropina ?? 0
    }
    
    func getnumPersonas() -> Int {
        return resultModel?.numPersonas ?? 0
    }
    
    func getTotalPerPerson() -> Double {
        return resultModel?.totalPerPerson ?? 0.0
    }
    
    mutating func setPorcentajePropina(porcentajePropina: String) {
        let firstValue = porcentajePropina.firstIndex(of: "%") ?? porcentajePropina.endIndex
        let valor = porcentajePropina[..<firstValue]
        self.porcentajePropina = String(valor)
    }
    
}
