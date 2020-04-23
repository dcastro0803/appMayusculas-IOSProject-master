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
            
    // Place the data in random form 2Uppercase and 2 Lowercase
    
    // DECIDE IF 2 PROBLEMS  OF 2 RULES: MAKE IT RANDOM
    // 2 PROBLEMS IPPERCASE AND 1 LOWERCASE   
    
    /*
    // This is the first element that is a dictionary
    // Here we make a loop to select from different rules if we want
    //FIRST LOOP The array will be the length of arrReglas
    var dic = arrReglasMayusculas[0] as! NSDictionary
    //cargar opcional porque trae de xml los datos
    // this is the the array from the key
    var arrEjercicios = dic["ejerciciosFacil"] as! NSArray
    
    //SECOND LOOP From here we start the loop this are the exercises
    // We make an array of labels and an array of segmented Control
    
    // Here we select the first ejercise, the loop is the size of arrEjercicios
    var arrEjerciciosItem = arrEjercicios[0] as! NSArray
    //Here we select the dictionary: This 0 doesn't change anytime
    var dicItem = arrEjerciciosItem[0] as! NSDictionary
    
    lbPregunta1.text = dicItem["pregunta"] as? String
    scRespuesta1.setTitle(dicItem["opcion1"] as? String, forSegmentAt: 0)
    scRespuesta1.setTitle(dicItem["opcion2"] as? String, forSegmentAt: 1)
    
    scRespuesta1.selectedSegmentIndex = UISegmentedControl.noSegment
    
    // Here end of loop
    */
    
    // Here we start the loops to make the random selection of the problems to solve
    // start the array to change the data of these elements
    let arrayLabels = [lPregunta1, lPregunta2, lPregunta3]
    let arraySegmentControl = [scRespuesta1, scRespuesta2, scRespuesta3]
    
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
        
        
        arrayLabels[n]?.text = dicItem["pregunta"] as? String
        arraySegmentControl[n]?.setTitle(dicItem["opcion1"] as? String, forSegmentAt: 0)
        arraySegmentControl[n]?.setTitle(dicItem["opcion2"] as? String, forSegmentAt: 1)
    }
            
            let dic2 = arrReglasMinusculas[0] as! NSDictionary
            var arrEjercicios2 = dic2["ejerciciosDificil"] as! NSArray
            
            var randomNumber2 = Int.random(in: 0..<arrEjercicios2.count)
            var arrEjerciciosItem2 = arrEjercicios2[randomNumber2] as! NSArray
            
            randomNumber2 = Int.random(in: 0..<arrEjerciciosItem2.count)
            var dicItem2 = arrEjerciciosItem2[randomNumber2] as! NSDictionary
            
            let Resp2 = dicItem2["respuesta"] as! String
            
            arrSoluciones.append(Resp2)
            
            arrayLabels[2]?.text = dicItem2["pregunta"] as? String
            arraySegmentControl[2]?.setTitle(dicItem2["opcion1"] as? String, forSegmentAt: 0)
            arraySegmentControl[2]?.setTitle(dicItem2["opcion2"] as? String, forSegmentAt: 1)
            
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
    }
    

}
