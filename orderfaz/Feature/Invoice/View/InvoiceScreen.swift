//
//  InvoiceScreen.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation
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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading,spacing: 10) {
                Group {
                    Text("Nama Pelanggan *")
                    TextField (
                        "Nama",
                        text: $username
                    )
                }
                
                Group {
                    Text("Nomor Telepon *")
                    TextField(
                        "No Telepon",
                        text: $phoneNumber.value
                    )
                }
                
                Group {
                    Text("Email")
                    TextField(
                        "Email",
                        text: $email
                    )
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
                            }.padding(5)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray,lineWidth: 0.5)
                                }
                            
                        }
                        if selectedSorting != Channels.none {
                            TextField(
                                "Id / Name",
                                text: $channelName
                            )
                        }
                        
                    }
                    
                }
                
                Group {
                    Text("Harga Produk *")
                    TextField(
                        "Harga Produk",
                        text: $price.value
                    )
                }
                
                Group {
                    Text("Metode Pembayaran")
                    RadioButtonGroups { selected in
                        print("Selected Gender is: \(selected)")
                    }
                }
                
                Group {
                    Button("Buat Invoice")  {
                        if !username.isEmpty && !phoneNumber.value.isEmpty && !price.value.isEmpty {
                            Task {
                                await send()
                            }
                        }
                        
                    }
                    .buttonStyle(NormalButton())
                }.padding(.top,20)
                
                
                Spacer()
                
            }
            .font(.system(size: 14))
            .textFieldStyle(.roundedBorder)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            .navigationTitle("Invoice")
        }
        .toastView(toast: $toast)
    }
    
    
    func send() async {
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
            }
        } catch {
            print(error)
        }
        
    }
}

struct InvoiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceScreen()
    }
}
