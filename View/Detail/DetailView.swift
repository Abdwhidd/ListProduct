//
//  DetailView.swift
//  ListProduct
//
//  Created by Wahid on 21/07/22.
//

import SwiftUI
import URLImage

struct DetailView: View {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var vm = DetailViewModel()
    @State private var readMore = false
    
    let product : Product
    let resultAdd = Int().self
    
    init(product: Product) {
        self.product = product
        // self.vm.getDetail(id: id)
//                self.vm.checkFavorite(id: id)
    }
    
    func imageURL() -> URL {
        if let url = self.vm.productDetail.images {
            return URL(string: url[0]) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                AsyncImage(url: URL(string: product.attributes.images.first ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 200, height: 210)
                
                
                Text(product.attributes.name)
                    .padding(.top)
                    .font(.title)
                
                Text("Lorem ipsum, Dolor sit, Amet consectetur, Elit")
                    .foregroundColor(Color.gray)
                    .font(.subheadline)
                
                Divider()
                    .padding(.top)
                
                HStack {
                    VStack { // 1 list Vstack
                        VStack {
                            StarViewItem()
                                .padding(.leading)
                            
                            Text("\(Int(product.attributes.rating))")
                                .padding(.top, 3)
                                .font(.body)
                            
                            Text("Reviews")
                        }
                        
                    }
                    Divider()
                    VStack { // 1 list Vstack
                        VStack {
                            Image("IconPoint")
                            
                            Text("\(Int(product.attributes.points))")
                                .padding(.top, 3)
                                .font(.body)
                            
                            Text("Points")
                        }
                        
                    }
                    
                    Divider()
                    Spacer()
                    
                    VStack {
                        VStack {
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(.red)
                                .padding(.trailing, 20)
                                .background(Color.white)
                        }
                    }
                }
                
                Divider()
                
                Text(product.attributes.description)
                    .font(.caption)
                    .padding(.all, 10)
                    .lineLimit(5)
                
                HStack {
                    Button("-") {
                        print("delete")
                    }
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.white)
                    .background(Color.secondary)
                    .cornerRadius(25)
                    .multilineTextAlignment(.leading)
                    
//                    Text(""\(Int(resultAdd))"")
                    
                    Button("+") {
                        print("Ditambahkan")
                    }
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.white)
                    .background(Color.secondary)
                    .cornerRadius(25)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 50)
                    
                    Button("Add to Cart") {
                        print("Berhasil masuk di cart")
                    }
                    .frame(width: 150, height: 40)
                    .foregroundColor(Color.green)
                    .border(Color.green, width: 2)
                    .cornerRadius(5)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 10)
                    
                }
                Button("Redeem") {
                    print("Berhasil Redeem")
                }
                .frame(width: 300, height: 45)
                .foregroundColor(Color.white)
                .background(Color.green)
                .border(Color.green, width: 2)
                .cornerRadius(5)
                .multilineTextAlignment(.leading)
                .padding(.top, 40)
                
            }
        }
    }



}
