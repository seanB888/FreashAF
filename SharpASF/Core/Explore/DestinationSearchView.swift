//
//  DestinationSearchView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guest
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 1
    
    var body: some View {
        VStack {
            // MARK: -Top NavBar
            HStack {
                // Close button...
                Button(action: {
                    withAnimation(.easeInOut) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Spacer()
                // Clear button...[button shows up if the field has data]
                if !destination.isEmpty {
                    Button(action: {
                        destination = ""
                    }, label: {
                        Text("Clear")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                })
                }
            }
            .padding(.horizontal, 30)
            
            // MARK: - Location View
            VStack {
                VStack(alignment: .leading) {
                    if selectedOption == .location {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            
                            TextField("Search destinations", text: $destination)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    } else {
                        CustomPickerView(title: "Where", description: "Add destination")
                    }
                }
            }
            .modifier(CustomViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {selectedOption = .location}
            }
            
            // MARK: - Date selection
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CustomPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CustomViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {selectedOption = .dates}
            }
            
            // MARK: - Number of guest
            VStack(alignment: .leading) {
                if selectedOption == .guest {
                        Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuest) Adults")
                    } onIncrement: {
                        numGuest += 1
                    } onDecrement: {
                        guard numGuest > 1 else {return}
                        numGuest -= 1
                    }
                    
                    
                } else {
                    CustomPickerView(title: "Who", description: "Add guest")
                }
                
            }
            .modifier(CustomViewModifier())
            .frame(height: selectedOption == .guest ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {selectedOption = .guest}
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}
