//
//  ViewController.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 11/09/24.
//

import UIKit
import StreamChatUI

class DemoChannelList: ChatChannelListVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func setUpAppearance() {
        super.setUpAppearance()
        title = "Connections"
        let leftButton = UIBarButtonItem(title: "Connections", style: .plain, target: self, action: nil)
        let attributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
        ]
        
        // Apply the attributes to the normal state of the left bar button
        leftButton.setTitleTextAttributes(attributes, for: .normal)
        navigationItem.title = nil

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItem?.tintColor = .white

        collectionView.backgroundColor = UIColor(named: "bgColor")
        
        
    }

}

 
