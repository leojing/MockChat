//
//  ViewController.swift
//  Chat
//
//  Created by Jing Luo on 6/12/17.
//  Copyright © 2017 Jing Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    fileprivate var messages = [["how are you?", true], ["Good, how are you?", true], ["fine, how is your holiday?", true], ["Very nice, I visited lots countries.", true], ["Which countries?", true], ["Some Asia countries, I like China the most. It's so amazing.", true], ["Wow, that's cool, tell me more about china.", true], ["China, officially the People's Republic of China (PRC), is a unitary sovereign state in East Asia and the world's most populous country, with a population of around 1.404 billion.[13] Covering approximately 9.6 million square kilometres (3.7 million square miles), it is the world's second-largest state by land area[19] and third- or fourth-largest by total area.[j] Governed by the Communist Party of China, it exercises jurisdiction over 22 provinces, five autonomous regions, four direct-controlled municipalities (Beijing, Tianjin, Shanghai, and Chongqing) and the Special Administrative Regions Hong Kong and Macau, also claiming sovereignty over Taiwan.", true]]
    fileprivate var sentMessages = [Any]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.estimatedRowHeight = 100
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.register(ChatMeCell.nib(), forCellReuseIdentifier: ChatMeCell.reuseId())
            self.tableView.register(ChatNotMeCell.nib(), forCellReuseIdentifier: ChatNotMeCell.reuseId())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.tableView.beginUpdates()
            self.sentMessages.append(self.messages[index])
            self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            self.tableView.endUpdates()
            self.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .bottom, animated: true)
            index = index + 1
            if (index >= self.messages.count) {
                timer.invalidate()
                
                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) {_ in
                    self.tableView.beginUpdates()
                    self.sentMessages[2] = ["fine, how is your holiday?", false]
                    self.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .none)
                    self.tableView.endUpdates()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sentMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BaseChatCell
        
        if indexPath.row%2 == 0 {
            cell = ChatMeCell.cellForTableView(tableView)

        } else {
            cell = ChatNotMeCell.cellForTableView(tableView)
        }
        
        if let message = sentMessages[indexPath.row] as? [Any] {
            cell.userNameLabel.text = "user \(indexPath.row%2)"
            cell.dateTimeLabel.text = Date().formatAsShortDate()

            if let text = message[0] as? String {
                cell.messageLabel.text = text
            }
            if let success = message[1] as? Bool {
                cell.messageSentFailedIcon.isHidden = success
            }
        }
        return cell
    }
}


extension Date {
    func formatAsShortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        
        let dateText = dateFormatter.string(from: self).lowercased()
        return dateText
    }
}

