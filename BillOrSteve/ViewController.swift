//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your instance variables here
    
    var dictionary: [String: [String]] = ["": [""]]
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var bill: UIButton!
    
    @IBOutlet weak var steve: UIButton!
    
    @IBAction func steveButton(sender: AnyObject) {
        //print("\(person) send button")
        if  "Steve Jobs" == (person) {
            realScore += 1
            score.text = String(realScore)
            showFact()
        } else {
            //print("Steve else loop")
            showFact()
        }
    }
    
    @IBAction func billButton(sender: AnyObject) {
        //print("\(person) send button")
        if  "Bill Gates" == (person) {
            realScore += 1
            score.text = String(realScore)
            showFact()
        } else {
            //print("Steve else loop")
            showFact()
        }
    }
    var nameAndFact = ("","")
    
    var realScore = 0
    
    var person = ""
    func showFact() {
        let nameAndFact = getRandomFact()
        person = nameAndFact.0
        print("\(nameAndFact.0) show fact")
        factLabel.text = nameAndFact.1
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        score.text = String(realScore)
        createFacts()
        showFact()
    }
    
    func createFacts() {
        let jobsArray = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let gatesArray = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        dictionary = ["Steve Jobs": jobsArray, "Bill Gates": gatesArray ]
    }
    
    func getRandomFact() -> (String, String) {
        var factTuple = ("", "")
        let individual = randomPerson()
        if let whichArray = dictionary[individual] {
            let newTuple = (individual, whichArray[randomNumberFromZeroTo(3)])
            factTuple = newTuple
        }
        return factTuple
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(number)))
        
    }
    
    func randomPerson() -> String {
        
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
        
    }
    
}
