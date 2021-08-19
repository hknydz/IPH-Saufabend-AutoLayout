//
//  ViewController.swift
//  Saufabend
//
//  Created by Just Lenz on 20.06.21.
//

import UIKit

class ViewController: UIViewController {

    //Variablen anlegen
    
    //Eingabefelder
    @IBOutlet weak var betragTextField: UITextField!
    @IBOutlet weak var personenTextField: UITextField!
    
    //Prozent-Label & -Slider
    @IBOutlet weak var prozentLabel: UILabel!
    @IBOutlet weak var prozentSlider: UISlider!
    
    //Ausgabe-Label
    @IBOutlet weak var trinkgeldLabel: UILabel!
    @IBOutlet weak var gesamtKostenLabel: UILabel!
    @IBOutlet weak var kostenProPersonLabel: UILabel!
    
    //Rechen-Werte als Variablen
    var drinksKosten = 0.0
    var trinkgeldProzent = 0.0
    var trinkgeldKosten = 0.0
    var gesamtKosten = 0.0
    var kostenProPerson = 0.0
    
    //Funktionen anlegen
    
    //Prozent-Buttons Funktion
    @IBAction func prozentButtonAction(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "10%" {
            prozentLabel.text = "10%"
            prozentSlider.value = 10.0
            ausrechnenDerKosten()
            return
        }
        
        if sender.titleLabel?.text == "15%"{
            prozentLabel.text = "15%"
            prozentSlider.value = 15.0
            ausrechnenDerKosten()
            return
        }
        
        if sender.titleLabel?.text == "20%" {
            prozentLabel.text = "20%"
            prozentSlider.value = 20.0
            ausrechnenDerKosten()
            return
        }
    }
    
    //Slider Funktion
    @IBAction func prozentSliderAction(_ sender: UISlider) {
        
        let prozentString = String(format: "%.0f", sender.value)
        prozentLabel.text = ("\(prozentString)%")
        
        ausrechnenDerKosten()
    }
    
    //Ausrechnen Funktion
    func ausrechnenDerKosten(){
        
        drinksKosten = Double(betragTextField.text!) ?? 0.0
        trinkgeldProzent = Double(prozentSlider.value) //Slider sind normalerweise Floats, deswegen hier das Casten
        
        //Berechnung des Trinkgeldes & der Gesamtkosten
        trinkgeldKosten = (drinksKosten * trinkgeldProzent) / 100
        gesamtKosten = drinksKosten + trinkgeldKosten
        
        //Kosten pro Person
        kostenProPerson = gesamtKosten / (Double(personenTextField.text!) ?? 0.0)
        
        //Ausgabe der Berechnung in den Labels
        printWerte()
    }
    
    //Funktion zum Setzen der Labels -> nur zur Ausgabe
    func printWerte(){
        
        let stringTrinkgeld = String(format: "%.2f", trinkgeldKosten)
        let stringGesamtKosten = String(format: "%.2f", gesamtKosten)
        let stringKostenProPerson = String(format: "%.2f", kostenProPerson)
        
        trinkgeldLabel.text = "Trinkgeld: \(stringTrinkgeld)€"
        gesamtKostenLabel.text = "Gesamtkosten: \(stringGesamtKosten)€"
        kostenProPersonLabel.text = "Kosten pro Person: \(stringKostenProPerson)€"
    }
    
    //Funktion für das Entfernen des Keyboards bei Touch in der View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

