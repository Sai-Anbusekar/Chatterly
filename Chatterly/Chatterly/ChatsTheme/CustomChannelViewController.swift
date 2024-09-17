//
//  CustomChannelViewController.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 13/09/24.
//

import Foundation
import StreamChat
import StreamChatUI
import UIKit

class CustomChatMessageComposerView: ComposerView {
    override func setUpAppearance() {
        super.setUpAppearance()
        
        // Change the background color of the chat input box
        
        backgroundColor = UIColor(named: "bgColor")
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        attachmentButton.setImage(UIImage(systemName: "camera"), for: .normal)
        attachmentButton.tintColor = .white
        
        sendButton.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        sendButton.tintColor = .lightGray
        
//        leadingContainer.removeArrangedSubview(attachmentButton)
        leadingContainer.removeArrangedSubview(commandsButton)

    }
}


