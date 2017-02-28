//
//  CacheItem.swift
//  Pods
//
//  Created by Joe Ferrucci on 2/28/17.
//
//

import Foundation

extension CacheItem: NSCoding {
    
    ////////////////////////////
    // MARK: - NSCoding
    ////////////////////////////
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(value, forKey: CacheItem.keys.value)
    }
}

class CacheItem: NSObject {
    
    ////////////////////////////
    // MARK: - Static Keys
    ////////////////////////////
    
    static let keys = (
        value: "value",
        expirationDate: "expirationDate"
    )
    
    ////////////////////////////
    // MARK: - Properties
    ////////////////////////////
    
    let value: Swift.AnyObject
    let expirationDate: Foundation.Date
    
    ////////////////////////////
    // MARK: - Initialization
    ////////////////////////////
    
    init(value: Swift.AnyObject, expirationDate: Foundation.Date) {
        self.value = value
        self.expirationDate = expirationDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard
            let value = aDecoder.decodeObject(forKey: CacheItem.keys.value),
            let expirationDate = aDecoder.decodeObject(forKey: CacheItem.keys.expirationDate) as? Foundation.Date
            else {
                return nil
        }
        self.value = value as Swift.AnyObject
        self.expirationDate = expirationDate
        super.init()
    }
    
}
