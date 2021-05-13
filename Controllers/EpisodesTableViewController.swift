//
//  EpisodesTableViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 20/11/2020.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
        
    var model: [Episode]
    
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let notificationCenter = NotificationCenter.default
//        
        notificationCenter.addObserver(self,
          selector: #selector(storyDidChange(notification:)),
          name: Notification.Name(STORY_DID_CHANGE_NOTIFICATION_NAME),
          object: nil)
        
    }
    
    @objc func storyDidChange(notification: Notification) {
        
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // wich house we will be showing
        let episode = model[indexPath.row]
        
        // creating a cell
        let cellId = "EpisodeCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // sync cell and house (view - model)
        
        cell?.textLabel?.text = episode.name
        
       // return cell
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
