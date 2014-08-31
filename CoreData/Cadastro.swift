//
//  Cadastro.swift
//  CoreData
//
//  Created by Lucas Conceição on 21/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class Cadastro: NSManagedObject {
    
    @NSManaged var nome:String
    @NSManaged var telefone:NSNumber
    @NSManaged var cidade:Cidade?
    
    override init(entity: NSEntityDescription!, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    class func entityDescription() -> (NSEntityDescription){
        let entity:NSEntityDescription = DataManager.getEntity("Cadastro")
        return entity
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