// Created on: November 22
// Created by: Nicholas.Pasco-Arnone
// Created for: ICS3U
// This program will calculate the smallest of 10 generated numbers
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel : UILabel = UILabel()
    let highestLabel : UILabel = UILabel()
    let addButton : UIButton = UIButton()
    var numberArray : [Int] = []
    var count = 0
    var rowCount = 0
    var highestNumber = 100
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Click the button to generate ten random numbers between 0 and 100 and find the smallest."
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        addButton.setTitle("Find smallest number", for: UIControl.State.normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addToArray), for: .touchUpInside)
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(highestLabel)
        highestLabel.translatesAutoresizingMaskIntoConstraints = false
        highestLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor, constant: 20).isActive = true
        highestLabel.leadingAnchor.constraint(equalTo: instructionsLabel.leadingAnchor).isActive = true
    }
    
    
    @objc func addToArray() {
        count += 1
        for _ in 1 ... 10 {
            let randomNumber : Int = Int(arc4random_uniform(100) + 1)
            numberArray.append(randomNumber)
            count += 1
            let generatedNumber : UILabel = UILabel()
            view.addSubview(generatedNumber)
            generatedNumber.translatesAutoresizingMaskIntoConstraints = false
            generatedNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(200 + count * 20)).isActive = true
            generatedNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(20 + rowCount * 30)).isActive = true
            generatedNumber.text = "\(randomNumber)"
        }
        for randomNumber in numberArray {
            if randomNumber < highestNumber {
                highestNumber = randomNumber
            }
        }
        highestLabel.text = "The current highest is \(highestNumber)"
        //rowCount += 1
        //count = 0
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
