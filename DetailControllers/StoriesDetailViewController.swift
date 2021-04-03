//
//  StoriesDetailViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 18/11/2020.
//

import UIKit

class StoriesDetailViewController: UIViewController {
    
    var charactersButton = UIBarButtonItem()
    
    @IBOutlet weak var titleStory: UILabel!
    @IBOutlet weak var descriptionStory: UILabel!
    @IBOutlet weak var imageStory: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var model: Story
    
    init(model: Story) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        syncModelWithView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        assert(titleStory != nil)
    }
    
    func syncModelWithView() {
        let date = model.releaseDate
        // Convert Date to String
        let setdate = SetDate()
        let dateString =  setdate.dateToString(for: date)
        
        titleStory.text = model.name
        imageStory.image = model.image
        descriptionStory.text = model.plot
        dateLabel.text = dateString
        
        if model._episodes.count > 0 {
            setUpUI()
        }
    }
    
    func setUpUI() {
        
        charactersButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItems =  [charactersButton]
        
    }
    
    @objc func displayEpisodes() {
        
        let array = Array(model._episodes.sorted())
        let episodesViewController = EpisodesTableViewController(model: array)
        
        navigationController?.pushViewController(episodesViewController , animated: true)
    }
    
    
}

extension StoriesDetailViewController : StoriesListViewControllerDelegate {
    
    func storiesListViewController(_ viewController: StoriesTableViewController, didSelectStory story: Story) {
        self.model = story
        syncModelWithView()
    }
}


