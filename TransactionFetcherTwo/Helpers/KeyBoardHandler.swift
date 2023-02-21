//
//  KeyBoardHandler.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 22/04/2022.
//

import Foundation
import UIKit
import Combine

final class KeyBoardHandler: ObservableObject {
    @Published var keyBoardHeight: CGFloat = 0
    var cancellable: AnyCancellable?
    
    let sub = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification, object: nil)
        .compactMap( { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height  } )


    init() {
        cancellable = sub.assign(to: \KeyBoardHandler.keyBoardHeight, on: self)
    }
}
