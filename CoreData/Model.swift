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
}

class Cadastro: NSManagedObject {
    @NSManaged var nome:String
    @NSManaged var telefone:NSNumber
    @NSManaged var cidade:Cidade
}