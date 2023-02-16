//
//  ContentView.swift
//  PopUpSwiftUI
//
//  Created by Mobile Programming  on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPopUp = false
    
    var body: some View {
        ZStack {
            VStack (spacing : 20) {
               Text("Click the button below to show choices of fruits")
               
               Button(action: {
                   withAnimation(.linear(duration: 1)) {
                      showPopUp = true
                   }
               },label: {
                   Text("Show")
               })
            }
            if $showPopUp.wrappedValue {
                 popUpView()
             }
           }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private let choices = ["Poor", "good", "Not Working", "Not available", "Not Applicable","House", "Office", "Work"]

struct popUpView : View {
    var body: some View {
        
        VStack (spacing : 10) {
            HStack {
                Spacer()

                Text("Select Item").font(Font.custom("Avenir-Black", size: 16.0))
                Spacer()
                Button {
     //               showPopUp = false

                } label: {
                    Image(systemName: "multiply.circle")
                        .resizable().frame(width: 32, height: 32)
                        .foregroundColor(.red)
                }
            }
            List(choices, id:\.self) { Text($0) }
         }
         .padding()
         .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/1.5)
         .background(Color.white)
         .cornerRadius(20)
         .shadow(radius: 20 )
     }
}

