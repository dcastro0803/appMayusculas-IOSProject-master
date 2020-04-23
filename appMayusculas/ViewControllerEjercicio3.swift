//
//  ViewControllerEjercicio3.swift
//  appMayusculas
//
//  Created by user164056 on 4/20/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ViewControllerEjercicio3: UIViewController {

    @IBOutlet weak var lPregunta1: UILabel!
    @IBOutlet weak var lPregunta2: UILabel!
    @IBOutlet weak var lPregunta3: UILabel!
    
    @IBOutlet weak var scRespuesta1: UISegmentedControl!
    @IBOutlet weak var scRespuesta2: UISegmentedControl!
    @IBOutlet weak var scRespuesta3: UISegmentedControl!
    
    
    
    var arrReglasMayusculas : NSArray!
    var arrReglasMinusculas : NSArray!
    var arrSoluciones = [String]()
    
    var arraySegmentControl =   [UISegmentedControl]()
    var arrOpcionCorrecta = [String]()
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            self.title = "Ejercicio 1"

            var pathReglas = Bundle.main.path(forResource: "ReglasMayusculas", ofType: "plist")
            arrReglasMayusculas = NSArray(contentsOfFile: pathReglas!)
            
            pathReglas = Bundle.main.path(forResource: "ReglasMinusculas", ofType: "plist")
            arrReglasMinusculas = NSArray(contentsOfFile: pathReglas!)
        // Do any additional setup after loading the view.
            
        scRespuesta1.selectedSegmentIndex = UISegmentedControl.noSegment
        scRespuesta2.selectedSegmentIndex = UISegmentedControl.noSegment
        scRespuesta3.selectedSegmentIndex = UISegmentedControl.noSegment
        
        print("Selected index")
        print(scRespuesta1.selectedSegmentIndex)
    // Place the data in random form 2Uppercase and 2 Lowercase
    
    // DECIDE IF 2 PROBLEMS  OF 2 RULES: MAKE IT RANDOM
    // 2 PROBLEMS IPPERCASE AND 1 LOWERCASE  
    
    // Here we start the loops to make the random selection of the problems to solve
    // start the array to change the data of these elements
    let arrayLabels = [lPregunta1, lPregunta2, lPregunta3]
    arraySegmentControl = [scRespuesta1, scRespuesta2, scRespuesta3]
    
    // This is to select random order
    // Place later
    let auxSet: [Int] = []
    let counterElementsRendered : Set = Set(auxSet)
    
    // Start the looping for the Mayusc
    var randomNumber = Int.random(in: 0..<arrReglasMayusculas.count)
    
    // We start with 2 Mayusculas
    for n in 0..<2 {
        randomNumber = Int.random(in: 0..<arrReglasMayusculas.count)
        print(randomNumber)
        var dic = arrReglasMayusculas[randomNumber] as! NSDictionary
        var arrEjercicios = dic["ejerciciosDificil"] as! NSArray
        
        
        // Select a random number for the size
        var randomNumber = Int.random(in: 0..<arrEjercicios.count)
        
        var arrEjerciciosItem = arrEjercicios[randomNumber] as! NSArray
        
        //Here we select the dictionary: This 0 doesn't change anytime
        randomNumber = Int.random(in: 0..<arrEjerciciosItem.count)
        var dicItem = arrEjerciciosItem[randomNumber] as! NSDictionary
        
        let Resp = dicItem["respuesta"] as! String
        
        
         print(Resp)
        arrSoluciones.append(Resp)
        
        arrOpcionCorrecta.append(dicItem["opcionCorrecta"] as! String)
        
        arrayLabels[n]?.text = dicItem["pregunta"] as? String
        arraySegmentControl[n].setTitle(dicItem["opcion1"] as? String, forSegmentAt: 0)
        arraySegmentControl[n].setTitle(dicItem["opcion2"] as? String, forSegmentAt: 1)
    }
            
            let dic2 = arrReglasMinusculas[0] as! NSDictionary
            var arrEjercicios2 = dic2["ejerciciosDificil"] as! NSArray
            
            var randomNumber2 = Int.random(in: 0..<arrEjercicios2.count)
            var arrEjerciciosItem2 = arrEjercicios2[randomNumber2] as! NSArray
            
            randomNumber2 = Int.random(in: 0..<arrEjerciciosItem2.count)
            var dicItem2 = arrEjerciciosItem2[randomNumber2] as! NSDictionary
            
            let Resp2 = dicItem2["respuesta"] as! String
            
            arrSoluciones.append(Resp2)
            arrOpcionCorrecta.append(dicItem2["opcionCorrecta"] as! String)
            
            arrayLabels[2]?.text = dicItem2["pregunta"] as? String
            arraySegmentControl[2].setTitle(dicItem2["opcion1"] as? String, forSegmentAt: 0)
            arraySegmentControl[2].setTitle(dicItem2["opcion2"] as? String, forSegmentAt: 1)
            
    }
    
    
    func checkIfAnswers(arrAnswers:[UISegmentedControl], arrSolutions: [String]) -> [Bool]{
        var answerArray = Array(repeating: false, count: 3)
        for n in 0..<arrAnswers.count {
            if(arrAnswers[n].selectedSegmentIndex == 0 && arrAnswers[n].titleForSegment(at: 0) == arrSolutions[n]){// Get content of segmented title
                answerArray[n] = true
            }
            if(arrAnswers[n].selectedSegmentIndex == 1 && arrAnswers[n].titleForSegment(at: 1) == arrSolutions[n]){// Get content of segmented title
                answerArray[n] = true
            }
        }
        return answerArray
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if identifier == "Results" {
            var performSegue = true
            // Check indexes of all segmented control
            for n in 0..<arraySegmentControl.count {
                if(arraySegmentControl[n].selectedSegmentIndex > 1 || arraySegmentControl[n].selectedSegmentIndex < 0){
                    performSegue = false
                }
            }
            
            // Place an alert
            print("Value of segue")
           print(performSegue)
            if(!performSegue){
                       let alertController = UIAlertController(title: "Cuidado", message:
                                             "Debes completar todos los campos del ejercicio", preferredStyle: .alert)
                                         alertController.addAction(UIAlertAction(title: "OK", style: .default))
                                         self.present(alertController, animated: true, completion: nil)
                   }
            
            return performSegue
        }

        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let Respuesta = segue.destination as! ViewControllerRespuestas3
        
        Respuesta.Respuesta1 = arrSoluciones[0]
        Respuesta.Respuesta2 = arrSoluciones[1]
        Respuesta.Respuesta3 = arrSoluciones[2]
        
        
        // Send the data to verify which exercise was correct
        let arrCorrectIncorrect = checkIfAnswers(arrAnswers: arraySegmentControl, arrSolutions: arrOpcionCorrecta)
        print(arrCorrectIncorrect)
        Respuesta.arrAnswers = arrCorrectIncorrect
    }
    

}
