//
//  PortfolioDataService.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 3/6/26.
//

import Foundation
import CoreData
import Combine

class PortfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName = "PortfolioContainer"
    private let entityName = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: containerName)
        self.container.loadPersistentStores { _, error in
            if let error = error {
                print("[⚠️] Error loading Core Data! \(error) ")
            }
            
            self.getPortfolio()
        }
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        
        do {
           savedEntities =  try container.viewContext.fetch(request)
            
        } catch let error {
            print("[⚠️] Error fetching Portfolio Entities: \(error)")
        }
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("[⚠️] Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
