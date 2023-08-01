//
//  InvoiceScreen.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

struct InvoiceScreen: View {
    @State private var username: String = ""
    @State private var phoneNumber = NumbersOnly()
    @State private var email: String = ""
    @State private var channelName: String = ""
    @State private var price = NumbersOnly()
    @State private var selected = 1
    @State private var selectedSorting: Channels = Channels.none
    @State private var toast: Toast? = nil
    @State private var loading:Bool = false
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading,spacing: 10) {
                    Group {
                        Text("Nama Pelanggan *")
                        KeyboardTextField("Nama", text: $username, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                            .frame(height: 30)
                    }
                    
                    Group {
                        Text("Nomor Telepon *")
                        KeyboardTextField("No Telepon", text: $phoneNumber.value, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                            .frame(height: 30)
                            .keyboardType(.numberPad)
                    }
                    
                    Group {
                        Text("Email")
                        KeyboardTextField("Email", text: $email, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                            .frame(height: 30)
                    }
                    
                    Group {
                        Text("Channel")
                        HStack {
                            Menu {
                                Picker("Sort", selection: $selectedSorting) {
                                    ForEach(Channels.allCases) {
                                        Text($0.title)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedSorting.title)
                                        .fontWeight(.medium)
                                        .foregroundColor(selectedSorting == Channels.none ? .gray : .black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .fontWeight(.medium)
                                        .foregroundColor(.gray)
                                }
                                .padding(EdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 5))
                                .overlay {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.gray,lineWidth: 0.5)
                                    }
                            }
                            if selectedSorting != Channels.none {
                                KeyboardTextField("Id / Name", text: $channelName, controller: controller)
                                    .focused($isFocused, doneButton: doneButton)
                                    .frame(height: 30)
                            }
                            
                        }
                        
                    }
                    
                    Group {
                        Text("Harga Produk *")
                        KeyboardTextField("Harga Produk", text: $price.value, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                            .frame(height: 30)
                            .keyboardType(.numberPad)
                    }
                    
                    Group {
                        Text("Metode Pembayaran")
                        RadioButtonGroups { selected in
                            print("Selected Gender is: \(selected)")
                        }
                    }
                    
                    Group {
                        Button  {
                            if !username.isEmpty && !phoneNumber.value.isEmpty && !price.value.isEmpty {
                                Task {
                                    await send()
                                }
                            }
                        } label: {
                            if loading {
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .foregroundColor(.white)
                            } else {
                                Text("Buat Invoice")
                            }
                        }
                        .buttonStyle(NormalButton())
                    }.padding(.top,20)
                    
                    
                    Spacer()
                    
                }
                .font(.system(size: 14))
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            }
            
            if isFocused {
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
                .background(Color(0xE5E5E5))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Invoice")
        .toolbarBackground(.visible, for: .navigationBar)
        .toastView(toast: $toast)
    }
    
    
    func send() async {
        self.isFocused = false
        
        let additionalFee = [AdditionalFee]()
        
        let productSnapshot = [Products]()
        
        var shipmentSnapshot = ShipmentSnapshot()
        
        var bundleSnapshot = ProductBundleSnapshots()
        
        var request = OrderDetail()
        
        var requestOrder = RequestOrder()
        
        shipmentSnapshot.isSelfCourier = true
        
        bundleSnapshot.customValue = Int(price.value) ?? 0
        bundleSnapshot.additionalFees = additionalFee
        bundleSnapshot.productSnapshot = productSnapshot
        bundleSnapshot.shipmentSnapshot = shipmentSnapshot
        
        request.storeId = "81c15c89-c0d9-48d3-b045-8f70904bf94f"
        request.customerName = username
        request.customerPhone = phoneNumber.value
        request.channelName = channelName
        request.customerEmail = email
        request.channelProvider = selectedSorting.title
        request.productBundleSnapshot = [bundleSnapshot]
        
        requestOrder.orderType = 100
        requestOrder.orderDetails = request
        requestOrder.paymentMethod = selected == 1 ? "Payment Link" : selected == 2 ? "Cash" : "Rekening Pribadi"
        
        
        do {
            DispatchQueue.main.async {
                self.loading = true
            }
            
            try await InvoiceService().sendInvoice(invoiceReq: requestOrder) {result in
                switch result {
                case .success(let data):
                    if data {
                        username = ""
                        phoneNumber.value = ""
                        channelName = ""
                        email = ""
                        price.value = ""
                        selectedSorting = Channels.none
                        
                        toast = Toast(style: .success, message: "Berhasil membuat Invoice!.")
                    }
                case .failure(_ ):
                    toast = Toast(style: .error, message: "Gagal membuat Invoice!.")
                }
                
                DispatchQueue.main.async {
                    self.loading = false
                }
            }
        } catch {
            toast =  Toast(style: .error, message: "\(error)")
        }
        
    }
}

struct InvoiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceScreen(controller: KeyboardInputViewController())
    }
}
