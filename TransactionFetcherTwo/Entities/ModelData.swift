//
//  ModelData.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 20/04/2022.
//

import Foundation
import Combine

// conformance to 'ObservableObject' allows instances of thes class to be observed and trigger events
final class ModelData: ObservableObject {
    
    @Published var transactions: [Transaction] = [] // @Published means that the changes to these property will trigger view reloads
    @Published var address: String = ""
    @Published var isLoading: Bool = false
    var loadedFirstPage: Bool = false
    var page: Int = 1
    
    private var subsriptionsCanceler = Set<AnyCancellable>()
    
    
    init(response: TransactionsResponse? = nil) {
        if let response = response {
            transactions = response.transactions
        }
    }
    
    func populateCoreData() {
        self.transactions.forEach { transaction in
            let cdTransaction = CDTransaction(context: PersistenceController.shared.container.viewContext)
            cdTransaction.confirmations = transaction.confirmations
            cdTransaction.timeStamp = transaction.timeStamp
            cdTransaction.from = transaction.from
        }
    }
    
    func fetchTransactions() {
        isLoading = true
         
        Network.manager.getTransactionsForAddressPublisher(address: address, page: self.page, offset: 5)
        .sink(receiveCompletion: {
              print("completion: \($0)")
              self.isLoading = false

        }, receiveValue: {
              self.isLoading = false
              if let error = $0.error {
                 return print("error received: \(error)")
              }
              self.transactions += $0.transactions!
              self.populateCoreData()
            print(self.transactions)
              self.page += 1
        })
        .store(in: &subsriptionsCanceler)
        
    }
    
}
