//
//  MockCollectionable.swift
//  SpaceCells
//
//  Created by Mario on 30/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import Foundation
//@testable import SpaceCells

class MockCollectionableViewModel: CollectionableViewModel {
    
    let text: String
    var onRowSelectedCalled = false
    
    init(_ text: String) {
        self.text = text
    }
    
    func onRowSelected() {
        onRowSelectedCalled = true
    }
}

class MockCollectionable: Collectionable {
    
    let empty: Bool
    private lazy var section0 = ["0.0", "0.1", "0.2"].map({ MockCollectionableViewModel($0) })
    private lazy var section1 = ["1.0", "1.1", "1.2"].map({ MockCollectionableViewModel($0) })
    
    init(empty: Bool) {
        self.empty = empty
    }
    
    func items() -> [Int : [MockCollectionableViewModel]]? {
        
        guard !empty else {
            return nil
        }
        
        return [
            0: section0,
            1: section1
        ]
    }
}
