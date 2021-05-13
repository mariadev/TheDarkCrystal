//
//  CharactersTableViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 19/11/2020.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    var model: [Character]
    
    init(model: [Character]) {
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
        
        notificationCenter.addObserver(self,
          selector: #selector(raceDidChange(notification:)),
          name: Notification.Name(RACE_DID_CHANGE_NOTIFICATION_NAME),
          object: nil)
        
    }
    
    @objc func raceDidChange(notification: Notification) {
        
        guard let info = notification.userInfo,
              let race = info[RACE_KEY] as? Race else {
            return
        }
        
        let array = Array(race._characters.sorted())
        model = array
        tableView.reloadData()
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
        let character = model[indexPath.row]
        
        // creating a cell
        let cellId = "CharacterCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // sync cell and house (view - model)
        
        cell?.textLabel?.text = character.name
        
       // return cell
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let character = model[indexPath.row]
        
        let characterDetailViewController = CharacterDetailViewController(model: character)

        navigationController?.pushViewController((characterDetailViewController), animated: true)
    }
    
}
