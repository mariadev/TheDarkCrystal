//
//  CharacterDetailViewController.swift
//  TheDarkCrystal
//
//  Created by Maria on 19/11/2020.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var model: Character
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var descriptionCharacter: UILabel!
    @IBOutlet weak var aphorimsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init(model: Character) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self,
          selector: #selector(raceDidChange(notification:)),
          name: Notification.Name(RACE_DID_CHANGE_NOTIFICATION_NAME),
          object: nil)
        syncModelWithView()
        
    }
    
    
    @objc func raceDidChange(notification: Notification) {

        navigationController?.popToRootViewController(animated: true)
    }
    
    func syncModelWithView() {
        characterNameLabel.text = model.name
        characterImage.image = model.image
        aphorimsLabel.text = "\"\(model.aphorism)\""
        descriptionCharacter.text = model.description
    }

}
