//
//  SearchView.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/7/21.
//

import SwiftUI

struct SearchView: View {
    
    // Tracks the text being searched
    @Binding var searchString: String
    
    // Track whether/ not the user is editing the search bar, and the cancel button should be shown
    @State private var isEditing = false
    
    var body: some View {
        
        HStack {
            // MARK: - Search Field
            TextField("Search...", text: $searchString)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(  // Makes x button show within the search bar
                    HStack {
                        
                        // Makes a magnifying glass appear on the left side of the search bar
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        // Makes an x button show on the right side
                        if isEditing {
                            Button {
                                // If the x button is pressed, we make the search string empty
                                self.searchString = ""
                            } label: {
                                // Makes the x button
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }

                            
                        }
                        
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
            
            // MARK: - Cancel Button
            // See if the person is editing the search, otherwise, don't show this cancel button
            if isEditing {
                
                Button {
                    self.isEditing = false
                    self.searchString = "" // Makes our search text empty as well
                } label: {
                    Text("Cancel")
                }
//                .padding(.trailing, 10) // Makes it 10 from the right
                .transition(.move(edge: .trailing))
                .animation(.default)

                
            }
                
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchString: .constant(""))
    }
}
