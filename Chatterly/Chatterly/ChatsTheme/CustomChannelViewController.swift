////
////  CustomChannelViewController.swift
////  Chatterly
////
////  Created by Anbu Sekar M on 13/09/24.
////
//
//import Foundation
//import StreamChat
//import StreamChatUI
//import UIKit
//
//open class CustomChannelViewController: UIViewController, ThemeProvider {
//
//    /// Controller for observing data changes within the channel.
//    open var channelController: ChatChannelController!
//
//    /// The message list component responsible to render the messages.
//    open lazy var messageListVC: ChatMessageListVC = ChatMessageListVC()
//
//    /// Controller that handles the composer view.
//    open lazy var messageComposerVC = ComposerVC()
//
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Setup
//        messageListVC.delegate = self
//        messageListVC.dataSource = self
//        messageListVC.client = ChatClient.shared
//
//        // Setup Channel Controller
//        channelController.delegate = self
//        channelController.synchronize()
//
//        // Layout
//        messageListVC.view.translatesAutoresizingMaskIntoConstraints = false
//        addChildViewController(messageListVC, targetView: view)
//        NSLayoutConstraint.activate([
//            messageListVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            messageListVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            messageListVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            messageListVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//}
//
//
//
//
//extension CustomChannelViewController: ChatMessageListVCDataSource {
//    public var messages: [StreamChat.ChatMessage] {
//        get {
//            return self.messages
//        }
//        set(newValue) {
//            
//        }
//    }
//    
//    public func channel(for vc: ChatMessageListVC) -> ChatChannel? {
//        channelController.channel
//    }
//
//    public func numberOfMessages(in vc: ChatMessageListVC) -> Int {
//        channelController.messages.count
//    }
//
//    public func chatMessageListVC(_ vc: ChatMessageListVC, messageAt indexPath: IndexPath) -> ChatMessage? {
//        return channelController.messages[indexPath.item]
//    }
//
//    public func chatMessageListVC(
//        _ vc: ChatMessageListVC,
//        messageLayoutOptionsAt indexPath: IndexPath
//    ) -> ChatMessageLayoutOptions {
//        guard let channel = channelController.channel else { return [] }
//        return messageListVC.components.messageLayoutOptionsResolver.optionsForMessage(
//            at: indexPath,
//            in: channel,
//            with: AnyRandomAccessCollection(channelController.messages),
//            appearance: messageListVC.appearance
//        )
//    }
//}
//
//
//extension CustomChannelViewController: ChatMessageListVCDelegate {
//    public func chatMessageListVC(_ vc: StreamChatUI.ChatMessageListVC, didTapOnMessageListView messageListView: StreamChatUI.ChatMessageListView, with gestureRecognizer: UITapGestureRecognizer) {
//        
//    }
//    
//    public func chatMessageListVC(
//        _ vc: ChatMessageListVC,
//        willDisplayMessageAt indexPath: IndexPath
//    ) {
//
//        // Load previous messages before showing the last 10 messages.
//        if indexPath.row < channelController.messages.count - 10 {
//            return
//        }
//
//        channelController.loadPreviousMessages()
//    }
//
//    public func chatMessageListVC(
//        _ vc: ChatMessageListVC,
//        didTapOnAction actionItem: ChatMessageActionItem,
//        for message: ChatMessage
//    ) {
//        // Handle message actions
//        switch actionItem {
//        case is EditActionItem:
//            dismiss(animated: true) { [weak self] in
//                self?.messageComposerVC.content.editMessage(message)
//            }
//        case is InlineReplyActionItem:
//            dismiss(animated: true) { [weak self] in
//                self?.messageComposerVC.content.quoteMessage(message)
//            }
//        case is ThreadReplyActionItem:
//            dismiss(animated: true) { [weak self] in
//                self?.messageListVC.showThread(messageId: message.id)
//            }
//        default:
//            return
//        }
//    }
//
//    public func chatMessageListVC(_ vc: ChatMessageListVC, scrollViewDidScroll scrollView: UIScrollView) {
//        // Handle scroll events, and check if the last message was read, to mark the channel read.
//        if messageListVC.listView.isLastCellFullyVisible, channelController.channel?.isUnread == true {
//            channelController.markRead()
//        }
//    }
//
//}
//
//
//extension CustomChannelViewController: ChatChannelControllerDelegate {
//
//    public func channelController(
//        _ channelController: ChatChannelController,
//        didUpdateMessages changes: [ListChange<ChatMessage>]
//    ) {
//        messageListVC.updateMessages(with: changes)
//    }
//
//    public func channelController(
//        _ channelController: ChatChannelController,
//        didUpdateChannel channel: EntityChange<ChatChannel>
//    ) {
//        let channelUnreadCount = channelController.channel?.unreadCount ?? .noUnread
//        messageListVC.scrollToBottomButton.isHidden = channelUnreadCount != .noUnread
//    }
//
//    public func channelController(
//        _ channelController: ChatChannelController,
//        didChangeTypingUsers typingUsers: Set<ChatUser>
//    ) {
//        guard channelController.areTypingEventsEnabled else { return }
//
//        let currentUserId = channelController.client.currentUserId
//
//        let typingUsersWithoutCurrentUser = typingUsers
//            .sorted { $0.id < $1.id }
//            .filter { $0.id != currentUserId }
//
//        if typingUsersWithoutCurrentUser.isEmpty {
//            messageListVC.hideTypingIndicator()
//        } else {
//            messageListVC.showTypingIndicator(typingUsers: typingUsersWithoutCurrentUser)
//        }
//    }
//}
//
//final class CustomMessageListVC: ChatMessageListVC {
//
//    override func cellContentClassForMessage(at indexPath: IndexPath) -> ChatMessageContentView.Type {
//        CustomChatMessageContentView.self
//    }
//
//}
//
////Extension
//
//extension UIViewController {
//    func addChildViewController(_ child: UIViewController, targetView superview: UIView) {
//        child.willMove(toParent: self)
//        addChild(child)
//        superview.addSubview(child.view)
//        child.didMove(toParent: self)
//    }
//}
