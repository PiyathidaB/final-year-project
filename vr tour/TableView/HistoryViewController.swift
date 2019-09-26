//
//  HistoryViewController.swift
//  vr tour
//
//  Created by student on 3/9/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDataSource {
   
    var userHistory = UserDatabase.user()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        cell.scoreLabel.text = "10"
        
        let user = userHistory[indexPath.row]
        cell.setupCell(user: user)
        

        return cell
    }
    
    @IBAction func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
}
