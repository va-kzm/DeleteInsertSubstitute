//
//  ViewController.swift
//  DeleteInsertSubstitute
//
//  Created by Mokhamad Valid Kazimi on 05.06.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var firstStringTextField: UITextField!
    @IBOutlet weak var secondStringTextField: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var operationsListLbl: UILabel!
    @IBOutlet weak var transformBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        transformBtn.layer.cornerRadius = 5
    }
    
    // Methods
    func performTransformation(of firstString: String, into secondString: String) {
        if firstString != "" && secondString != "" {
            let listOfOperations = getTheListOfOperations(for: firstString, and: secondString)
            resultLbl.text = listOfOperations
        } else {
            let alert = UIAlertController(title: "An empty textfield was detected", message: "Please be sure to add text to both textfields 🤓", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true
                , completion: nil)
        }
    }
    
    func getTheListOfOperations(for firstString: String, and secondString: String) -> String {
        var listOfOperations = ""
        var firstCharacterArray = [Character]()
        var secondCharacterArray = [Character]()
        var sameCharacterInArray = false
        
        for i in firstString {
            firstCharacterArray.append(i)
        }
        
        for y in secondString {
            secondCharacterArray.append(y)
        }
        
        for i in stride(from: 0, to: firstCharacterArray.count, by: 1) {
            for y in stride(from: i, to: secondCharacterArray.count, by: 1) {
                
                let char1 = firstCharacterArray[i]
                let char2 = secondCharacterArray[y]
                
                print("This is char1: \(char1)")
                print("This is char2: \(char2)")
                print(String(firstCharacterArray))
                
                if char1 == char2 {
                    break
                } else {
                    for yy in y..<secondCharacterArray.count {
                        let char22 = secondCharacterArray[yy]
                        
                        if  char1 == char22 {
                            firstCharacterArray.insert(char2, at: i)
                            listOfOperations += "i"
                            sameCharacterInArray = true
                            print(listOfOperations)
                            print(firstCharacterArray)
                            break
                        }
                    }
                    
                    if char1 != char2 && !sameCharacterInArray {
                        firstCharacterArray.remove(at: i)
                        firstCharacterArray.insert(char2, at: i)
                        listOfOperations += "s"
                    }
                    sameCharacterInArray = false
                    print("This is resultSymbols: \(listOfOperations)")
                    print(String(firstCharacterArray))
                    break
                }
            }
        }
        
        if firstCharacterArray.count > secondCharacterArray.count {
            let extraCounts = firstCharacterArray.count - secondCharacterArray.count
            let arrayStartIndex = firstCharacterArray.count - extraCounts
            print(arrayStartIndex)
            for _ in arrayStartIndex..<firstCharacterArray.count {
                firstCharacterArray.remove(at: arrayStartIndex)
                listOfOperations += "d"
                print("This is resultSymbols: \(listOfOperations)")
                print(String(firstCharacterArray))
            }
        } else if firstCharacterArray.count < secondCharacterArray.count {
            let extraCounts = secondCharacterArray.count - firstCharacterArray.count
            let arrayStartIndex = secondCharacterArray.count - extraCounts
            for i in 0..<extraCounts {
                firstCharacterArray.append(secondCharacterArray[arrayStartIndex + i])
                listOfOperations += "d"
                print("This is resultSymbols: \(listOfOperations)")
                print(String(firstCharacterArray))
            }
        }
        
        return listOfOperations
    }
    
    // Actions
    @IBAction func transformBtnPressed() {
        performTransformation(of: firstStringTextField.text!, into: secondStringTextField.text!)
        resultLbl.isHidden = false
        operationsListLbl.isHidden = false
    }
}

