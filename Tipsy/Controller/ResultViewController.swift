//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Juan Navarro  on 2/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbl_totalPerPerson: UILabel!
    @IBOutlet weak var lbl_detalle: UILabel!
    
    var porcentajePropina: Int?
    var numPersonas: Int?
    var totalPerPerson: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_totalPerPerson.text = String(format: "%.2f", totalPerPerson!)
        lbl_detalle.text = "Split between \(numPersonas!) people, with \(porcentajePropina!)% tip."
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btn_reCalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
