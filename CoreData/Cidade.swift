//
//  Model.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class Cidade: NSManagedObject {
    
    @NSManaged var nome:String
    
    override init(entity: NSEntityDescription!, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    class func entityDescription() -> (NSEntityDescription){
        let entity:NSEntityDescription = DataManager.getEntity("Cidade")
        return entity
    }
    
    func delete(){
        
        let context:NSManagedObjectContext = DataManager.getContext()
        var error:NSError?
        
        context.deleteObject(self)
        context.save(&error)
        
        if (error != nil){
            NSLog(error!.description)
        }
    }
    
    func salvar(){
        
        let context:NSManagedObjectContext = DataManager.getContext()
        var error:NSError?
        
        if (self.managedObjectContext == nil) {
            context.insertObject(self)
        }
        
        context.save(&error)
        
        if (error != nil){
            NSLog(error!.description)
        }
    }
}