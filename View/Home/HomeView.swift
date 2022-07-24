//
//  HomeView.swift
//  ListProduct
//
//  Created by Wahid on 21/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var vm = HomeViewModel()
    @State private var columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical,showsIndicators:false){
                    
                    LazyVStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("All Gift")
                                .font(.title)
                                .padding([.bottom],10)
                            
                            Spacer()
                            
                            Button(action: {
                                if self.columns.count == 2 {
                                    self.columns.removeLast()
                                } else {
                                    self.columns.append(GridItem(.flexible(),spacing: 15))
                                }
                            }, label: {
                                Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }).padding()
                            
                        }.padding([.horizontal,.top])
                        
                        if (self.vm.productlist.count == 0){
                            HStack(alignment:.center) {
                                Spacer()
                                Indicator()
                                Spacer()
                            }
                        } else {
                            LazyVGrid(columns: self.columns, spacing: 25) {
                                ForEach(self.vm.productlist, id: \.id) { product in
                                    NavigationLink(destination: DetailView(product: product)){
                                        GridViewItem(item: product, columns: self.$columns)
                                    }
                                }
                            }.padding([.horizontal,.top])
                        }
                        
                    }
                }
            }
            
            .navigationTitle("Home")
        }.onAppear {
            vm.getData()
        
    }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

