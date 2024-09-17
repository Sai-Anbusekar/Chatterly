//
//  ViewController.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 11/09/24.
//

import UIKit
import StreamChatUI
import StreamChat

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
        
        // Customize collection view layout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0 // Space between the message cells (change to your desired value)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -40) // Add margins around the cells
            collectionView.collectionViewLayout = layout
//            collectionView.separatorInset
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
             
        }
        
    }

}

 
