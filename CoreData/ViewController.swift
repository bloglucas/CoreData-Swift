//
//  ViewController.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
                            
    @IBOutlet var nomeCidade: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func salvarCidade(sender: AnyObject) {
        
        let entity:NSEntityDescription = DataManager.getEntity("Cidade")
        var cidade:Cidade = Cidade(entity: entity, insertIntoManagedObjectContext: nil)
        cidade.nome = nomeCidade.text
        cidade.salvar()
    }

}

