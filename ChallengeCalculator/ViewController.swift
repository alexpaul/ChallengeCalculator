//
//  ViewController.swift
//  ChallengeCalculator
//
//  Created by Alex Paul on 12/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

enum ChallengeType: Int { // using raw values
  case elevation // 0
  case distance // 1
}

class ViewController: UIViewController {
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var metricTextField: UITextField!
  @IBOutlet weak var numberOfWeeksTextField: UITextField!
  @IBOutlet weak var messageLabel: UILabel!
  
  var currentChallenge: ChallengeType = ChallengeType.elevation {
    didSet {
      calculateChallenge()
    }
  }
  
  @IBAction func calculateChallengePressed(_ sender: UIButton) {
    calculateChallenge()
  }
  
  func calculateChallenge() {
    // get the metric and and the number of days from the textfields
    guard let metric = Double(metricTextField.text ?? ""),
      let numberOfWeeks = Int(numberOfWeeksTextField.text ?? "") else {
        // TODO: best to present an alert controller to the user
        print("missing required fields")
        return
    }
    
    let challenge = Challenge()
    
    let weeklyTraining = challenge.calculateWeeklyTraining(for: metric, and: numberOfWeeks)
    
    // switch on the current selected segment in our segmented control
    switch currentChallenge {
    case .elevation:
      messageLabel.text = "Weekly training: \(weeklyTraining) feet"
      // keep in mind feet and miles are hard-coded here
      // ideally those would be in user settings of the app
    case .distance:
      messageLabel.text = "Weekly training: \(weeklyTraining) miles"
    }
  }
  
  @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) { // index 0 or 1
    // udpate currentChallenge state
    currentChallenge = ChallengeType(rawValue: sender.selectedSegmentIndex) ?? ChallengeType.elevation
  }
  
  
}

