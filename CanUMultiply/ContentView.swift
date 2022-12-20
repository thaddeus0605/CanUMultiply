//
//  ContentView.swift
//  CanUMultiply
//
//  Created by Thaddeus Dronski on 12/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var multiplicationTable = 2

    @State private var numberOfQuestions = [5, 10, 15, 20]
    @State private var numberOfQuestion = 0
    
    @State private var questionArray = []
    @State private var answerArray = []
    
    @State private var userAnswer = 0
    @State private var answer = 0
    
    @State private var playingGame = false
    @State private var configuringGame = true
    

    
    
    struct Problem {
        var operand_1 = 0
        var operand_2 = 0
        
        var answer: Int {
            operand_1 * operand_2
        }
        
        var problemLabel: String {
            "\(operand_1) * \(operand_2)"
        }
    }
    
  
    
    var body: some View {
        NavigationStack {
            Form {
                if configuringGame {
                    Section {
                        Picker("Multiplcation Selector", selection: $multiplicationTable) {
                            ForEach(2..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    } header: {
                        Text("Select the times table you would like to test")
                    }
                    Section {
                        Picker("Selection number of questions", selection: $numberOfQuestion) {
                            ForEach(numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Select how many questions you would like to answer")
                    }
                    Button("Play Game!") {
                        configureGame()
                    }
                }
                
                if playingGame {
                    Section {
                       
                    }
                    
                }
                
            }
            .navigationTitle("CanUMultiply")
        }
    }
    
    func configureGame() {
        playingGame = true
        configuringGame = false
        
        var count = 0
        
        while count < numberOfQuestion {
            let randomNum = Int.random(in: 0...12)
            let problem = Problem(operand_1: multiplicationTable, operand_2: randomNum)
            
            let questionLabel = problem.problemLabel
            let questionAnswer = problem.answer
            
            questionArray.append(questionLabel)
            answerArray.append(questionAnswer)
            
            count += 1
        }
        print(questionArray)
        print(answerArray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
