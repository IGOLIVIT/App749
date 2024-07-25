//
//  StatisticsViewModel.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI
import CoreData

final class StatisticsViewModel: ObservableObject {

    
    @AppStorage("TG") var TG: Int = 0
    @AppStorage("TW") var TW: Int = 0
    @AppStorage("TD") var TD: Int = 0
    
    @Published var ATG: String = ""
    @Published var ATW: String = ""
    @Published var ATD: String = ""
    
    @Published var Photos: [String] = ["a1", "a2", "a3", "a4"]
    @Published var curPhoto1: String = ""
    @Published var curPhoto2: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    
    @Published var resName1: String = ""
    @Published var resName2: String = ""
    @Published var resPhoto1: String = ""
    @Published var resPhoto2: String = ""
    @Published var resScore1: String = ""
    @Published var resScore2: String = ""
    @Published var resDate: Date = Date()
    @Published var resTime: Date = Date()
    
    @Published var results: [ResModel] = []
    @Published var selectedResult: ResModel?
    
    func addResult() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ResModel", into: context) as! ResModel

        loan.resName1 = resName1
        loan.resName2 = resName2
        loan.resPhoto1 = resPhoto1
        loan.resPhoto2 = resPhoto2
        loan.resScore1 = resScore1
        loan.resScore2 = resScore2
        loan.resDate = resDate
        loan.resTime = resTime

        CoreDataStack.shared.saveContext()
    }

    func fetchResults() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ResModel>(entityName: "ResModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.results = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.results = []
        }
    }

}
