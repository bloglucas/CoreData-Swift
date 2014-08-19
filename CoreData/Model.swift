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
    
//    init(){
//        let entity:NSEntityDescription = DataManager.getEntity("Cidade")
//        super.init(entity: entity, insertIntoManagedObjectContext: nil)
//    }
    
    override init(entity: NSEntityDescription!, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    func salvar(){
        let context:NSManagedObjectContext = DataManager.getContext()
        var error:NSError?
        
        if (!self.inserted) {
            context.insertObject(self)
        }
        
        context.save(&error)
        
        if (error != nil){
            NSLog(error!.description)
        }
    }
}

class Cadastro: NSManagedObject {
    @NSManaged var nome:String
    @NSManaged var telefone:NSNumber
    @NSManaged var cidade:Cidade
}