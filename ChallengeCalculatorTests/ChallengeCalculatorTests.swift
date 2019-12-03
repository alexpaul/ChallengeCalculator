//
//  ChallengeCalculatorTests.swift
//  ChallengeCalculatorTests
//
//  Created by Alex Paul on 12/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import XCTest

// @testable is a compiler directive, enables this test suite
// to have access to the ChallengeCalculor modules
@testable import ChallengeCalculator

class ChallengeCalculatorTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    print("setUp - called before each test is run")
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    print("tearDown - called after each test is completed")
  }
  
  // test function does not take any parameters
  // test function does not return any values
  func testAddTwoNumbers() {
    // thress A's - arrange, act and assert
    // arrange your test in the following format
    
    // arrange (given) - setup constants, variable and the (system under test)
    let sut = Challenge()
    let num1 = 10
    let num2 = 5
    let expectedReuslt = 15
    
    // act (when) - perform workload
    let result = sut.addTwoNumbers(num1: num1, num2: num2)
    
    // assert (then) - test for given condition
    XCTAssertEqual(expectedReuslt, result, "\(result) should be \(expectedReuslt)")
  }
  
  func testCalculateWeeklyTraining() {
    // arrange
    let sut = Challenge() // creating an instance of Challenge
    let sutExpectedAverage = 2320 // feet elevation per week
    let metric = 11_602 // overall elevation challenge
    let numberOfWeeksForChallenge = 5 // weeks
    
    // act
    let weeklyTraining = sut.calculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
    
    // assert
    XCTAssertEqual(sutExpectedAverage, weeklyTraining, "\(weeklyTraining) should be equal to \(sutExpectedAverage)")
  }
  
  func testDivisionBy0ReturnsNegativeOne() {
    // arrange
    let sut = Challenge()
    let metric: Double = 11_602
    let numberOfWeeksForChallenge = 0
    let expectedOutput = -1
    
    // act
    let sutOutput = sut.calculateWeeklyTraining(for: metric, and: numberOfWeeksForChallenge)
    
    // assert
    XCTAssertEqual(sutOutput, expectedOutput)
  }
  
  
  // TDD - Test driven developement:
  /*
   You start off writing a unit test until it fails (or a compiler error), then go to production code e.g Challenge.swift file,
   fix the failure until the test passes, continue writing unit test until failure again and continue the cycle
  */
  func testAverageDailyMetric() {
    // arrange
    let sut = Challenge()
    let sutWeeklyTotalMetric = 2320 // total elevation
    let expectedDailyAverage = 773 // elevation per day
    let numberOfWorkoutDays = 3 // days
    
    // act
    // averageTrainingPerWeek expects to return 773
    let averageDailyTraining = sut.averageTrainingPerWeek(challengeMetric: sutWeeklyTotalMetric, numberOfWorkoutDays: numberOfWorkoutDays)
    
    // assert
    XCTAssertEqual(averageDailyTraining, expectedDailyAverage, "\(averageDailyTraining) should be equal to \(expectedDailyAverage)")
  }
  
}
