//
//  GoalsViewModel.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI
import CoreData

final class GoalsViewModel: ObservableObject {
    
    @Published var Types: [String] = ["Active", "Completed"]
    @Published var currentType = "Active"
    
    @Published var selectedTypeForAdd = "Active"

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var isReady: Bool = false

    @Published var statuss: [String] = ["Available", "In Service", "Servicing", "Not Available", "Waitibg"]
    @Published var currentStatus = ""

    @Published var goalStatus = ""
    @Published var goalName = ""
    @Published var goalDescription = ""
    @Published var goalSDate: Date = Date()
    @Published var goalEDate: Date = Date()
    @Published var goalItem = ""
    @Published var carNextService = ""

    @Published var goals: [GoalsModel] = []
    @Published var selectedGoal: GoalsModel?

    func addGoal() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalsModel", into: context) as! GoalsModel

        loan.goalStatus = goalStatus
        loan.goalName = goalName
        loan.goalDescription = goalDescription
        loan.goalItem = goalItem
        loan.goalSDate = goalSDate
        loan.goalEDate = goalEDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGoals() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalsModel>(entityName: "GoalsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.goals = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}
