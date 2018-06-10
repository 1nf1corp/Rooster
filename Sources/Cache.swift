//
//  Cache.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 03/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation
/**
 Cache only deals with storing and retrieving cached data
 Writes Data to the disk
 */

final class Cache<R: Resource> {
    ///Storage
    var storage = FileStorage()
    
    /// load data from the cache
    func load(_ resource: R) -> R.T? {
        guard case .get = resource.method else { return nil }
        let data = storage[resource.cacheKey]
        return data.flatMap(resource.parse)
    }
    
    /// save data to the cache
    func save(data: Data, for resource: R) {
        guard case .get = resource.method else { return }
        storage[resource.cacheKey] = data
    }
}
