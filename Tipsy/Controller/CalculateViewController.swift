//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var txt_costoFactura: UITextField!
    @IBOutlet weak var btn_zeroTip: UIButton!
    @IBOutlet weak var btn_tenTip: UIButton!
    @IBOutlet weak var btn_twentyTip: UIButton!
    @IBOutlet weak var lbl_cantPersonas: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func accionesButtons(_ sender: UIButton) {
        updateInterface()
        sender.isSelected = true
        calculateBrain.setPorcentajePropina(porcentajePropina: sender.currentTitle!) // porcentajePropina
    }
    
    @IBAction func stp_personas(_ sender: UIStepper) {
        let toInt = Int(sender.value)
        lbl_cantPersonas.text = String(toInt)
    }
    
    
    @IBAction func btn_calculate(_ sender: UIButton) {
        // numPersonas |totalBill
        let numP = Int(lbl_cantPersonas.text!)
        let tBill = (txt_costoFactura.text! as NSString).doubleValue
        calculateBrain.calculate(numPersonas: numP!, totalBill: tBill)
        self.performSegue(withIdentifier: "goToNext", sender: self)
        txt_costoFactura.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.porcentajePropina = calculateBrain.getporcentajePropina()
            destinationVC.numPersonas = calculateBrain.getnumPersonas()
            destinationVC.totalPerPerson = calculateBrain.getTotalPerPerson()
        }
    }
    
    func updateInterface() {
        btn_zeroTip.isSelected = false
        btn_tenTip.isSelected = false
        btn_twentyTip.isSelected = false
    }
    
}






//                ___                  ___ 
//               -   -________________-   -
//             /----.       AMP        .----\
//            (  __  |                |  __  )
//            | (@ ) |                | ( @) |
//           /\\____//                \\____//\
//          /              *:   :*             \
//          \`\ ____________________________ /`/
//           \                                /
//            \    $$$$$$$$$$$$$$$$$$$$$$    /
//             \    $$$$$$$$$$$$$$$$$$$$    /
//              -__  $$$$$$$$$$$$$$$$$$  __-
//                  -_$$$$$$$$$$$$$$$$_-





