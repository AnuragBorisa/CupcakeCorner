//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anurag on 21/01/25.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order : Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name",text:$order.name)
                TextField("Stree Address",text:$order.streetAddress)
                TextField("City",text:$order.city)
                TextField("Zip",text:$order.zip)
            }
            
            Section {
                NavigationLink("Check out"){
                    CheckOutView(order:order)
                }
            }
            .disabled(order.hasValidInputs == false)
        }
        .onAppear{
            order.loadAddressFromUserDefaults()
        }
        .onDisappear{
            order.saveAddressToUserDefaults()
        }
        .navigationTitle("Delivery Address")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order:Order())
}
