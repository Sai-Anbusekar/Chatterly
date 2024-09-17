//
//  CustomChatMessageListVC.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 17/09/24.
//

import Foundation
import StreamChat
import StreamChatUI
import UIKit

class CustomChatMessageListVC: ChatMessageListVC {
    override func setUp() {
        super.setUp()

        let customComposerView = CustomChatMessageComposerView()
        customComposerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customComposerView)

        // Set constraints for the composer view at the bottom
        NSLayoutConstraint.activate([
            customComposerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customComposerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customComposerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customComposerView.heightAnchor.constraint(equalToConstant: 50) // Adjust height if needed
            
        ])
        
        listView.backgroundColor = UIColor(named: "bgcolor")
        listView.backgroundColor = UIColor(named: "bgcolor")
    }
    
    override func setUpAppearance() {
        super.setUpAppearance()
        view.backgroundColor = UIColor(named: "bgcolor")
        listView.backgroundColor = UIColor(named: "bgcolor")


    }
}
