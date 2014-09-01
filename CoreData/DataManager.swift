//
//  CoreDataManager.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    class func getEntity(entidade: String) -> (NSEntityDescription){
        let delegate = (UIApplication.sharedApplication()).delegate as AppDelegate
        let context:NSManagedObjectContext? = delegate.managedObjectContext
        let description:NSEntityDescription = NSEntityDescription.entityForName(entidade, inManagedObjectContext: context)
        
        return description
    }
    
    class func getContext () -> (NSManagedObjectContext) {
        let delegate = (UIApplication.sharedApplication()).delegate as AppDelegate
        return delegate.managedObjectContext!
    }
    
    class func getAllManagedObjectsFromEntity(entity: NSEntityDescription) -> (sucesso: Bool, objects: NSArray){
        
        let delegate = (UIApplication.sharedApplication()).delegate as AppDelegate
        let context:NSManagedObjectContext? = delegate.managedObjectContext
        
        let request:NSFetchRequest = NSFetchRequest()
        request.entity = entity
        
        var error:NSError?
        var objects:NSArray? = context?.executeFetchRequest(request, error: &error)
        
        if(error == nil){
            return(true, objects!)
        }else{
            NSLog(error!.description)
            return(false, objects!)
        }
        
    }
    
    class func getManagedObjectsFromEntity(entity: NSEntityDescription, predicate:NSPredicate) -> (sucesso: Bool, objects: NSArray){
        let delegate = (UIApplication.sharedApplication()).delegate as AppDelegate
        let context:NSManagedObjectContext? = delegate.managedObjectContext
        
        let request:NSFetchRequest = NSFetchRequest()
        request.entity = entity
        request.predicate = predicate
        
        var error:NSError?
        var objects:NSArray? = context?.executeFetchRequest(request, error: &error)
        
        if(error == nil){
            return(true, objects!)
        }else{
            NSLog(error!.description)
            return(false, objects!)
        }
    }
    
}