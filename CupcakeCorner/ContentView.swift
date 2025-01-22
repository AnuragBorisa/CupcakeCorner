//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Anurag on 20/01/25.
//

import SwiftUI


struct ContentView: View {
   @State private var order = Order()
    var body: some View {
        NavigationStack{
            Form{
                Section{
                Picker("Choose the type",selection:$order.type){
                    ForEach(Order.types.indices,id:\.self){
                        Text(Order.types[$0]);
                    }
                }
                    Stepper("Number of cakes: \(order.quantity)",value:$order.quantity)
            }
                
                Section{
                    Toggle("Any special requests?",isOn:$order.specialRequestEnabled)
                    
                    if(order.specialRequestEnabled){
                        Toggle("Any extra frosting",isOn:$order.extraFrosting)
                        Toggle("Any extra sprinkle",isOn:$order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery Details"){
                        AddressView(order:order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
