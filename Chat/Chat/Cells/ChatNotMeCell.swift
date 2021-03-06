//
//  ChatNotMeCell.swift
//  Chat
//
//  Created by Jing Luo on 6/12/17.
//  Copyright © 2017 Jing Luo. All rights reserved.
//

import Foundation
import UIKit

class ChatNotMeCell: BaseChatCell {
    
    class func cellForTableView(_ tableView: UITableView) -> BaseChatCell {
        let id = reuseId()
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ChatNotMeCell {
            return cell
        } else {
            return ChatNotMeCell()
        }
    }
    
    override func update(_ value: Any) {
        super.update(value)
        addContentView(nil)
    }
    
    fileprivate func addContentView(_ item: Any?) {
        addedContentView.subviews.forEach({(subview) in subview.removeFromSuperview()})
        
        if item == nil {
            addedContentView.isHidden = true
            return
        }
        
        addedContentView.isHidden = false
        
        let contentWidth = 220
        var contentHeight = 220
        // For some reason the frame passed in is being tripled by the content cells
        let contentInternalView = UIView()
        contentInternalView.translatesAutoresizingMaskIntoConstraints = false
        addedContentView.addSubview(contentInternalView)
        
//        contentInternalView.pinTop(toTopOf: addedContentView, constant: 0)
//        contentInternalView.pinLeading(toLeadingOf: addedContentView, constant: 0)
//        let _ = contentInternalView.setWidth(to: CGFloat(contentWidth))
//        let _ = contentInternalView.setHeight(to: CGFloat(contentHeight))
//
        addedContentViewHeightConstraint?.constant = CGFloat(contentHeight)
        layoutIfNeeded()
    }

}
