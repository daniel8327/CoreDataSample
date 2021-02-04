//
//  LogVC.swift
//  CoreDataTest
//
//  Created by moonkyoochoi on 2021/02/04.
//

import UIKit

enum LogType: Int16 {
    case create
    case edit
    case delete
}

extension Int16 {
    func toLogType() -> String {
        switch self {
        case 0: return "생성"
        case 1: return "수정"
        case 2: return "삭제"
        default: return "-"
        }
    }
}
class LogVC: UITableViewController {
    
    var board: BoardMO!
    
    lazy var logs:[LogMO]! = {
        return board.logs?.array as! [LogMO]
    }()
    
    override func viewDidLoad() {
        self.navigationItem.title = self.board.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = logs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell")!
        cell.textLabel?.text = "\(row.regdate!)에 \(row.type.toLogType())되었습니다."
        
        return cell
    }
}
