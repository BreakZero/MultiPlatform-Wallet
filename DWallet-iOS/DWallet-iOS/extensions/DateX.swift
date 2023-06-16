//
//  DateX.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation

private let dateFormatter = DateFormatter()

extension Date {
    
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func formatToString(format: String = "HH:mm E, d MMM y") -> String {
        return dateFormatter.string(from: self)
    }
}
