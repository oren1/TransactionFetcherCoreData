//
//  Transaction.swift
//  Transactions Fetcher
//
//  Created by oren shalev on 30/03/2022.
//

import Foundation

// 'Identifiable' conformance require only and id variable that is unique for every instance.
// and when using 'ForEach' in a view we won't have to specify which variable is our id
// we can use ForEach(expenses.items) instead of ForEach(expenses.items, id: \.id)
// and the assignment of UUID() guarantees us a unique id for each instance.

struct Transaction: Codable, Identifiable {
   
    // coding keys allow us to to map the keys that comes from the json to keys that are more readable and we
    // prefer using them in our code
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case timeStamp = "timeStamp"
        case from = "from"
        case to = "to"
        case value = "value"
        case confirmations = "confirmations"
        case hash = "hash"
    }
    
    var id: UUID
    var timeStamp: String
    var from: String
    var to: String
    var value: String
    var confirmations: String
    var hash: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        timeStamp = try container.decode(String.self, forKey: .timeStamp)
        from = try container.decode(String.self, forKey: .from)
        to = try container.decode(String.self, forKey: .to)
        value = try container.decode(String.self, forKey: .value)
        confirmations = try container.decode(String.self, forKey: .confirmations)
        hash = try container.decode(String.self, forKey: .hash)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(timeStamp, forKey: .timeStamp)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
        try container.encode(value, forKey: .value)
        try container.encode(confirmations, forKey: .confirmations)
        try container.encode(hash, forKey: .hash)
    }
    
}
