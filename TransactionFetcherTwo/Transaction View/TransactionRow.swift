//
//  TransactionRow.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 20/04/2022.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: CDTransaction
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                
            HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Date")
                            .font(.headline)
                            
                        Text(transaction.timeStamp ?? "")
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)

                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Confirmations")
                            .font(.headline)

                        Text(transaction.confirmations ?? "")
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)

                }
                
//
//                TextPairView(title: "Value", value: transaction.value)
//                TextPairView(title: "From", value: transaction.from)
//                TextPairView(title: "To", value: transaction.to)
//                TextPairView(title: "Hash", value: transaction.from)
//                TextPairView(title: "From", value: transaction.from)
                
            }
            .foregroundColor(.white)
            .padding([.leading, .trailing], 10)
            .font(.callout)
            
        

    }
}

struct TextPairView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.01)
            Text(value)
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {

    static var previews: some View {
        TransactionRow(transaction: CDTransaction.example)
                .background(Color(red: 0.106, green: 0.129, blue: 0.204))
        
    }
}

