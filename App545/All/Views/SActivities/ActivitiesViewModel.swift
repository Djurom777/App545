//
//  ActivitiesViewModel.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI
import CoreData

final class ActivitiesViewModel: ObservableObject {
    
    @Published var Types: [String] = ["Active", "Completed"]
    @Published var currentType = "Active"
    
    @Published var selectedTypeForAdd = "Active"
    
    @Published var photosForAdd: [String] = ["activitiesPhoto"]
    @Published var currentPhoto = ""
    
    @Published var selectedPage = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddItem: Bool = false
    
    @Published var isReady: Bool = false

    @Published var actName = ""
    @Published var actDescription = ""
    @Published var actPhoto = ""

    @Published var activities: [ActivitiesModel] = []
    @Published var selectedActivity: ActivitiesModel?

    func addActivity() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ActivitiesModel", into: context) as! ActivitiesModel

        loan.actName = actName
        loan.actDescription = actDescription
        loan.actPhoto = actPhoto


        CoreDataStack.shared.saveContext()
    }
    
    func fetchActivities() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ActivitiesModel>(entityName: "ActivitiesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.activities = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.activities = []
        }
    }

    @Published var itemDescription = ""
    @Published var itemCurrentAct = ""
    @Published var itemName = ""
    
    @Published var items: [ItemsModel] = []
    @Published var selectedItem: ItemsModel?

    func addItem() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ItemsModel", into: context) as! ItemsModel

        loan.itemDescription = itemDescription
        loan.itemCurrentAct = itemCurrentAct
        loan.itemName = itemName
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchItems() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ItemsModel>(entityName: "ItemsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.items = result.filter{$0.itemCurrentAct == selectedPage}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.items = []
        }
    }
}
