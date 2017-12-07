//
//  ChatMeCell.swift
//  Chat
//
//  Created by Jing Luo on 6/12/17.
//  Copyright © 2017 Jing Luo. All rights reserved.
//

import Foundation
import UIKit

class ChatMeCell: BaseChatCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    class func cellForTableView(_ tableView: UITableView) -> BaseChatCell {
        let id = reuseId()
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ChatMeCell {
            return cell
        } else {
            return ChatMeCell()
        }
    }

    override func update(_ value: Any) {
        super.update(value)
    }
}
