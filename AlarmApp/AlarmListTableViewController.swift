//
//  AlarmListTableViewController.swift
//  AlarmApp
//
//  Created by Alex Aslett on 7/24/17.
//  Copyright © 2017 One Round Technology. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
      
    }
    
    // MARK: - IBOutlets
    
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.shared.mockAlarms.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as? SwitchTableViewCell
        let alarm = AlarmController.shared.mockAlarms[indexPath.row]
        cell?.updateViews(with: alarm)
        // Configure the cell...
        
        return cell ?? UITableViewCell()
    }




    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AlarmController.shared.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
