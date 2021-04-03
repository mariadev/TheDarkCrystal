//
//  RaceDetailViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 19/11/2020.
//

import UIKit

class RaceDetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionRaceLabel: UILabel!
    @IBOutlet weak var raceNameLabel: UILabel!
    
    var model: Race
    
    init(model: Race) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        setUpUI()
        
    }

    func syncModelWithView() {
        raceNameLabel.text = model.name
        descriptionRaceLabel.text = model.description
    }
    

    
    func setUpUI() {
        
        let charactersButton = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        
        navigationItem.rightBarButtonItems =  [charactersButton]
        
    }
    
    @objc func displayMembers() {
        
        let array = Array(model._characters.sorted())
        let charactersViewController = CharactersTableViewController(model: array)
        
        navigationController?.pushViewController(charactersViewController , animated: true)
    }

}

extension RaceDetailViewController : RaceTableViewControllerDelegate {
    func raceTableViewControllerDelegateFunc(_ viewController: RaceTableViewController, didSelectRace race: Race) {
          self.model = race
        syncModelWithView()
    }
}
