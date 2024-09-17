//
//  CustomChatChannelHeaderView.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 13/09/24.
//

import Foundation
import UIKit
import StreamChatUI
import StreamChat

class CustomChatChannelHeaderView: ChatChannelHeaderView {
    var typingUsers = Set<ChatUser>()

    // Handle typing events
    override func channelController(
        _ channelController: ChatChannelController,
        didChangeTypingUsers typingUsers: Set<ChatUser>
    ) {
        // Save the current typing users but the current user.
        // Then update the content.
        self.typingUsers = typingUsers.filter { $0.id != currentUserId }
        
        updateContentIfNeeded()
        
        
    }

    // The subtitleText is responsible to render the status of the members.
    override var subtitleText: String? {
        return ""
    }
    
    
}
