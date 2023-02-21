//
//  ContentView.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 20/04/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var keyBoardHandler = KeyBoardHandler()
    

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            if modelData.page <= 1 && modelData.isLoading == true {
                CustomProgressView(color: .green, scale: 2, bgColor: Color(red: 0.106, green: 0.129, blue: 0.204))
            }
            else {
                TransactionsList()
            }
            
            ZStack(alignment: .leading) {
                    if modelData.address.isEmpty {
                        Text("Enter Address")
                            .foregroundColor(.white)
                            .padding([.leading, .trailing], 20)
                    }
                
                    TextField("",text: $modelData.address)
                    .frame(height: 60)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing], 20)
                    .onSubmit {
                        guard validate(address: modelData.address) else { return }
                        modelData.fetchTransactions()
                    }
                    .disableAutocorrection(true)
                

            }
            .frame(height: 80)

                     
        }
//        .ignoresSafeArea(.container, edges: .bottom)
        .background(Color(red: 0.106, green: 0.129, blue: 0.204))

    }
}

func validate(address: String) -> Bool {
    guard !address.isEmpty else {
        return false
    }
    return true
}

struct ContentView_Previews: PreviewProvider {
    static let modelData = ModelData(response: load("Transactions.json"))
    static var previews: some View {
        ContentView()
            .environmentObject(modelData)
    }
}
