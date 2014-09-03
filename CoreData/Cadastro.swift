//
//  Cadastro.swift
//  CoreData
//
//  Created by Lucas Conceição on 21/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class Cadastro: AbstractEntity {
    
    @NSManaged var nome:String
    @NSManaged var telefone:NSNumber
    @NSManaged var cidade:Cidade?
    @NSManaged var rio:NSArray
    
    override class func entityDescription() -> (NSEntityDescription){
        return DataManager.getEntity("Cadastro")
    }
    
}