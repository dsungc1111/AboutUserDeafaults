//
//  Protocol.swift
//  AboutUserDeafaults
//
//  Created by 최대성 on 5/31/24.
//

import UIKit


protocol UserIdentifier {
    
    static var identifier: String { get  }
}






extension UITableViewCell: UserIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
