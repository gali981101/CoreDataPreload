//
//  MenuTableViewController.swift
//  Menu-CoreDataPreload
//
//  Created by Terry Jason on 2024/1/12.
//

import UIKit
import CoreData

class MenuTableViewController: UITableViewController {
    
    private var menuItems:[MenuItem] = []
    var fetchResultController: NSFetchedResultsController<MenuItem>!
    
}

// MARK: - Life Cycle

extension MenuTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { fatalError() }
        
        let request: NSFetchRequest<MenuItem> = MenuItem.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            menuItems = try context.fetch(request)
        } catch {
            print(error)
        }
        
        tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: - Table view data source

extension MenuTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.nameLabel.text = menuItems[indexPath.row].name
        cell.detailLabel.text = menuItems[indexPath.row].detail
        cell.priceLabel.text = "\(menuItems[indexPath.row].price)"
        
        return cell
    }
    
}

