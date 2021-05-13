//
//  StoriesTableViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 18/11/2020.
//

import UIKit

protocol StoriesListViewControllerDelegate: class {
    
    func storiesListViewController (_ viewController: StoriesTableViewController, didSelectStory story: Story)
    
}

class StoriesTableViewController: UITableViewController {
    
    let model: [Story]
    weak var delegate: StoriesListViewControllerDelegate?
    
    init(model: [Story]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "The Dark Crystal Stories"
        
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
        print()
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // wich house we will be showing
        let story = model[indexPath.row]
        
        // creating a cell
        let cellId = "StoryCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }

        // sync cell and house (view - model)
        cell?.textLabel?.numberOfLines = 0
        cell?.detailTextLabel?.numberOfLines = 0
        
        cell?.textLabel?.text = story.name
        
        let imageR = story.image
        cell?.imageView?.image = imageR.imageWithSize(size: CGSize(width: 70, height: 90))

        // return cell
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story =  model[indexPath.row]
        
//        let storiesDetailViewController = StoriesDetailViewController(model: story)
         delegate?.storiesListViewController(self, didSelectStory: story)
        
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(STORY_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [STORY_KEY: story])

        notificationCenter.post(notification)
        saveLastSelectedStory(at: indexPath.row)
    }
}

extension StoriesTableViewController {
    func saveLastSelectedStory(at index: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(index, forKey: LAST_STORY_KEY)
        userDefaults.synchronize()
    }
    
    func lastSelectedStory() -> Story {
        
        let index = UserDefaults.standard.integer(forKey: LAST_STORY_KEY)
        return story(at: index)
        
    }
    
    func story(at index: Int) -> Story {
        return model[index]
    }
}

extension  StoriesTableViewController: StoriesListViewControllerDelegate {
    func  storiesListViewController(_ vc: StoriesTableViewController, didSelectStory story: Story) {
        let storiesDetailViewController = StoriesDetailViewController(model: story)
        navigationController?.pushViewController(storiesDetailViewController, animated: true)
    }
}
