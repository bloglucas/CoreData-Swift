//
//  Model.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class Cidade: AbstractEntity {
    
    @NSManaged var nome:String
    
    override class func entityDescription() -> (NSEntityDescription){
        return DataManager.getEntity("Cidade")
    }
}