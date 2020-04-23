//
//  ViewControllerResultados1.swift
//  appMayusculas
//
//  Created by user164056 on 4/20/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ViewControllerResultados1: UIViewController {

    @IBOutlet weak var lResp1: UILabel!
    @IBOutlet weak var lResp2: UILabel!
    @IBOutlet weak var lResp3: UILabel!
    
    
    @IBOutlet weak var imgCorrectIncorrect1: UIImageView!
    
    @IBOutlet weak var imgCorrectIncorrect2: UIImageView!
    
    @IBOutlet weak var imgCorrectIncorrect3: UIImageView!
    
    
    
    var Respuesta1 : String!
    var Respuesta2 : String!
    var Respuesta3 : String!
    
    var arrAnswers : [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lResp1.text = Respuesta1
        lResp2.text = Respuesta2
        lResp3.text = Respuesta3
        imgCorrectIncorrect1.image = UIImage(named: "good")
        
        //imgCorrectIncorrect1.image = UIImage(named: "checkmark")
        
        let arrImages = [imgCorrectIncorrect1,imgCorrectIncorrect2,imgCorrectIncorrect3]
        // Do any additional setup after loading the view.
        for n in 0..<arrAnswers.count {
            if(arrAnswers[n]){
                arrImages[n]?.image = UIImage(named: "good")
            } else {
                arrImages[n]?.image = UIImage(named: "bad")
            }
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
