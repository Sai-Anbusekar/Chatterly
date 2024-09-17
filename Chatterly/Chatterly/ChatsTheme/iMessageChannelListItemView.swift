//
//  iMessageChannelListItemView.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 13/09/24.
//

import Foundation
import StreamChat
import StreamChatUI
import UIKit

class iMessageChannelListItemView: ChatChannelListItemView {

    // this is the blue dot to show next to channels with unread messages
    private lazy var customUnreadView: UIView = {
        let unreadView = UIView()
        unreadView.backgroundColor = tintColor
        unreadView.layer.masksToBounds = true
        unreadView.layer.cornerRadius = 5
        unreadView.clipsToBounds = true
        return unreadView
    }()

    override func setUpLayout() {
        super.setUpLayout()
        // Set constraints for the unread indicator
        NSLayoutConstraint.activate([
            customUnreadView.widthAnchor.constraint(equalTo: customUnreadView.heightAnchor),
            customUnreadView.widthAnchor.constraint(equalToConstant: 10),
        ])

        // Insert it as the left-most subview
        mainContainer.insertArrangedSubview(customUnreadView, at: 0)

        // Remove the original unread count indicator, since we don't need it anymore
        topContainer.removeArrangedSubview(unreadCountView)
    }

    override func updateContent() {
        super.updateContent()

        customUnreadView.alpha = unreadCountView.content == .noUnread ? 0 : 1
        subtitleLabel.textColor =  unreadCountView.content == .noUnread ? .lightGray : .white
        backgroundColor = UIColor(named: "bgColor")
    }
    override func setUpAppearance() {
        super.setUpAppearance()
        timestampLabel.isHidden = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana Bold", size: 14)
        
        
        
        backgroundColor = UIColor(named: "bgColor")
        
    }
    
}
