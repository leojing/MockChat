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
    }
    
}
