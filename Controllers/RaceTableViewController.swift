//
//  RaceTableViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 19/11/2020.
//

import UIKit


protocol RaceTableViewControllerDelegate: class {
    
    func raceTableViewControllerDelegateFunc (_ viewController:RaceTableViewController, didSelectRace race: Race)
    
}

class RaceTableViewController: UITableViewController {
    
    let model: [Race]
    var delegate : RaceTableViewControllerDelegate?
    
    init(model: [Race]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Races"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let race = model[indexPath.row]
        
        // creating a cell
        let cellId = "RaceCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // sync cell and house (view - model)
        
        cell?.textLabel?.text = race.name
        
       // return cell
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let race =  model[indexPath.row]

        delegate?.raceTableViewControllerDelegateFunc(self, didSelectRace: race)

        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(RACE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [RACE_KEY: race])

        notificationCenter.post(notification)
        saveLastSelectedRace(at: indexPath.row)
    }
}


extension RaceTableViewController {
    func saveLastSelectedRace(at index: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(index, forKey: LAST_RACE_KEY)
        userDefaults.synchronize()
    }
    
    func lastSelectedRace() -> Race {
        
        let index = UserDefaults.standard.integer(forKey: LAST_RACE_KEY)
        return race(at: index)
        
    }
    
    func race(at index: Int) -> Race {
        return model[index]
    }
}

extension  RaceTableViewController: RaceTableViewControllerDelegate {
    func  raceTableViewControllerDelegateFunc(_ vc: RaceTableViewController, didSelectRace race: Race) {
        let raceDetailViewController = RaceDetailViewController(model: race)
        navigationController?.pushViewController(raceDetailViewController, animated: true)
    }
}
