//
//  MenuTableViewController.swift
//  vr tour
//
//  Created by student on 27/8/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit
import  GoogleMaps

protocol MenuDelegate {
    func showPosition(position: CLLocationCoordinate2D)
}

class MenuTableViewController: UITableViewController {
    
    var delegate: MenuDelegate?
    let templeList = TempleDatabase.temples()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.layoutSubviews()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templeList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "templeCell", for: indexPath) as! TempleCell

        let temple = templeList[indexPath.row]
        cell.nameLabel.text = temple.name
//        cell.alterEgoLabel.text = temple.alterEgo
        cell.iconImageView.image = UIImage(named: temple.menu_icon)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        self.performSegue(withIdentifier: "SendDataSegue", sender: self)
        let long = templeList[indexPath.row].long
        let lat = templeList[indexPath.row].lat
        let positionLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        delegate?.showPosition(position: positionLocation)
        print("\(positionLocation)")
    }
}
