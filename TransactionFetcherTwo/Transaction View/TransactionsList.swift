//
//  TransactionsList.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 20/04/2022.
//

import SwiftUI
import CoreData

struct TransactionsList: View {
    @EnvironmentObject var modelData: ModelData
    
//    Once your managed object context is attached to the environment under the ".managedObjectContext" key,
//   you can use the @FetchRequest property wrapper to make properties in your views that create and manage Core Data fetch requests automatically.
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.timeStamp),
        SortDescriptor(\.from, order: .reverse)
    ]) var transactions: FetchedResults<CDTransaction>


    var body: some View {
        ZStack {
            Color(red: 0.106, green: 0.129, blue: 0.204)
            VStack {

                List {
                    ForEach(transactions) { transaction in
                        TransactionRow(transaction: transaction)
                    }
//                        ForEach(modelData.transactions) { transaction in
//                            TransactionRow(transaction: transaction)
//                        }
                        .padding([.bottom], 40)
                        .background(Color(red: 0.106, green: 0.129, blue: 0.204))
                        .listRowInsets(EdgeInsets())

                    if modelData.page > 1 &&
                       transactions.count > 0  &&
                       modelData.isLoading {
                            CustomProgressView(color: .white, scale: 1,
                                bgColor: Color(red: 0.106, green: 0.129, blue: 0.204))
                                .listRowInsets(EdgeInsets())
                                .onAppear {
                                    if transactions.count > 0 {
                                        modelData.fetchTransactions()
                                    }
                                }
                        }

                    }
                    .listStyle(.plain)

                }

        }

    }


}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsList()
            .environmentObject(ModelData(response: load("Transactions.json")))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



