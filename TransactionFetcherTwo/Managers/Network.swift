//
//  NetworkManager.swift
//  Transactions Fetcher
//
//  Created by oren shalev on 30/03/2022.
//

import Foundation
import Combine

enum NetworkError: Error {
    case url
}
extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .url:
            return "wrong url"
        }
    }
}

class Network {
    
    static let manager = Network()
    
    func getTransactionsForAddressPublisher(address: String, page: Int, offset: Int) -> AnyPublisher<TransactionsResponse, Error> {
        
            let urlString = "https://api.etherscan.io/api"
            + "?module=account"
            + "&action=txlist"
            + "&address=\(address)"
            + "&startblock=0"
            + "&endblock=99999999"
            + "&page=\(page)"
            + "&offset=\(offset)"
            + "&sort=asc"
            + "&apikey=6R44AVXQ7PCBVBH1YV52FHG1Q8368WVTG6"
        
            guard let url = URL(string: urlString) else {
                return Fail(error: NetworkError.url)
                    .eraseToAnyPublisher()
            }
        
            let request = URLRequest(url: url)
            
            return URLSession.shared.dataTaskPublisher(for: request)
            .retry(1)
            .map({ $0.data })
            .decode(type: TransactionsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
