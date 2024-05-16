//
//  ActDetail.swift
//  App545
//
//  Created by IGOR on 12/05/2024.
//

import SwiftUI

struct ActDetail: View {
    
    @StateObject var viewModel: ActivitiesViewModel
    @Environment(\.presentationMode) var retBack
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        retBack.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                    Spacer()
                    
                    
                }
                
                VStack(spacing: 12) {
                    
                    Image(viewModel.selectedActivity?.actPhoto ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                    Text(viewModel.selectedActivity?.actName ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    Text(viewModel.selectedActivity?.actDescription ?? "")
                        .foregroundColor(.gray.opacity(0.6))
                        .font(.system(size: 16, weight: .regular))
                    
                    ScrollView {
                        
                        LazyVStack(spacing: 12) {
                            
                            ForEach(viewModel.items, id: \.self) { index in
                            
                                HStack {
                                    
                                    Text(index.itemName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text(index.itemDescription ?? "")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                
                            }
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddItem = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("Add an item")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                .padding()
                    
                Spacer()
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddItem ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddItem = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddItem = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Item")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.itemName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.itemName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Value")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.itemDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.itemDescription)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                    .padding(1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddItem = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 0).stroke(Color("primary")))
                                .padding(1)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.itemCurrentAct = viewModel.selectedActivity?.actName ?? ""
                            
                            viewModel.addItem()
                            
                            viewModel.itemName = ""
                            
                            viewModel.itemDescription = ""
                            
                            viewModel.fetchItems()
                            
                            viewModel.itemCurrentAct = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddItem = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 0).fill(viewModel.itemName.isEmpty || viewModel.itemDescription.isEmpty ? Color.gray.opacity(0.6) : Color("primary")))
                        })
                        .disabled(viewModel.itemName.isEmpty || viewModel.itemDescription.isEmpty ? true : false)
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Rectangle().fill(.white))
                .padding()
                .offset(y: viewModel.isAddItem ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchItems()
        }
    }
}

#Preview {
    ActDetail(viewModel: ActivitiesViewModel())
}
