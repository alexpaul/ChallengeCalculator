//
//  Challenge.swift
//  ChallengeCalculator
//
//  Created by Alex Paul on 12/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Challenge {
  
  // illustration testing purposes - not a part of the app logic
  func addTwoNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
  }
  
  // user inputs 11,000 feet elevatio
  // user inputs 5 weeks
  func calculateWeeklyTraining(for metric: Double,
                               and weeks: Int) -> Int {
    
    // refactor to guard against 0 weeks
    guard weeks > 0 else { return -1 }
    
    // red (fails test), green (passes test), refactor (rewrite, optimize)
    
    return Int(metric) / weeks // average metric (elevation, distance) per week
  }
  
  // production code ships with the application - part of the logic for the application
  func averageTrainingPerWeek(challengeMetric: Int,
                              numberOfWorkoutDays: Int) -> Int {
    // guard againts zero, letters
    // refactor to guard for valid days of the week 1...7
    guard (1...7).contains(numberOfWorkoutDays) else { return -1 }
    
    return challengeMetric / numberOfWorkoutDays 
  }
  
  
}
