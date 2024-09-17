//
//  ChatManager.swift
//  Chatterly
//
//  Created by Anbu Sekar M on 12/09/24.
//

import Foundation
import StreamChat
import StreamChatUI
import UIKit

extension ChatClient {
    static var shared: ChatClient!
}
final class ChatManager {
    
   
    static let shared = ChatManager()
    
    private var client: ChatClientConfig!
    
    
    func setup() {
        let client = ChatClientConfig(apiKey: .init("ufsfjbum3yzq"))
        self.client = client
    }
    
    //Authentication
    func signIn(with username: String) {
        
        ChatClient.shared = ChatClient(config: self.client)
        ChatClient.shared.connectUser(userInfo: UserInfo(id: "kowsi", name: "kowsi", imageURL: URL(string: "")),token: Token(stringLiteral: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoia293c2kifQ.rjJ-c_C_ckXHtdWvE2BttcDoVdmGImQeNToNuQyAeIE"))
        
    }
    
    func FetchChannelList() -> UIViewController {
        let channelList = DemoChannelList()
        let query = ChannelListQuery(filter: .containMembers (userIds: ["kowsi"]))
        channelList.controller = ChatClient.shared.channelListController(query: query)
        channelList.view.backgroundColor = .secondarySystemBackground
        
        return channelList
    }
    
    
}
