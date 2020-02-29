//
//  EventsTableViewController.swift
//  Bushel iOS Challenge
//
//  Created by Jack Maring on 2/19/20.
//  Copyright © 2020 Jack Maring. All rights reserved.
//

import UIKit
import Alamofire

class EventsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let headers: HTTPHeaders = [
            "Authorization": K.token,
            "Accept": "application/json"
        ]
        
        AF.request("https://challenge.myriadapps.com/api/v1/events", headers: headers).responseJSON { response in
            print(response.value!)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
}

extension EventsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! EventCell
        
        return cell
    }
}

extension EventsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: K.eventsTableSegue, sender: self)
        
    }
}

