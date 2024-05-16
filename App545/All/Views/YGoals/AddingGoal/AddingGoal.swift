//
//  AddingGoal.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct AddingGoal: View {
    
    @StateObject var viewModel: GoalsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Goal")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        HStack {
                            
                            ForEach(viewModel.Types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedTypeForAdd = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.selectedTypeForAdd == index ? .white : .black)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(Rectangle().fill(viewModel.selectedTypeForAdd == index ? Color("primary") : .gray.opacity(0)))
                                })
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Rectangle().fill(.gray.opacity(0.5)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.goalName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.goalName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.goalDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.goalDescription)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Start date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.goalSDate, displayedComponents: .date, label: {})
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        HStack {
                            
                            Text("End date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.goalSDate, displayedComponents: .date, label: {})
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        Text("Add an item")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Items")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.goalDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.goalDescription)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.goalName = ""
                                viewModel.goalDescription = ""

                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 0).stroke(Color("primary")))
                            })
                            
                            Button(action: {
                                
                                viewModel.goalStatus = viewModel.selectedTypeForAdd
                                
                                viewModel.addGoal()
                                
                                viewModel.goalName = ""
                                viewModel.goalDescription = ""
                                
                                viewModel.fetchGoals()
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                               
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 0).fill(Color("primary")))
                            })
                            .opacity(viewModel.selectedTypeForAdd.isEmpty || viewModel.goalName.isEmpty || viewModel.goalDescription.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.selectedTypeForAdd.isEmpty || viewModel.goalName.isEmpty || viewModel.goalDescription.isEmpty ? true : false)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddingGoal(viewModel: GoalsViewModel())
}
