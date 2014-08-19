//
//  ListaCidadeViewController.swift
//  CoreData
//
//  Created by Lucas Conceição on 18/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import UIKit

class ListaCidadeViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dados:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let retorno = DataManager.getAllManagedObjectsFromEntity("Cidade")
        if (retorno.sucesso){
            dados = retorno.objects
        }else {
            dados = NSArray()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dados!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cellId:String = "Celula"
        
        var cell:UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        
        var cidade:Cidade = dados?.objectAtIndex(indexPath.row) as Cidade
        if (cell == nil){
            cell!.textLabel.text = "Erro"
        }else{
            cell!.textLabel.text = cidade.nome
        }
        return cell

    }
    
}