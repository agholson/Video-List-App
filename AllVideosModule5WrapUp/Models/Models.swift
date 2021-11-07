//
//  Models.swift
//  AllVideosModule5WrapUp
//
//  Created by Shepherd on 11/6/21.
//

import Foundation

struct Video: Identifiable, Decodable {
    
    var id: Int
    var title: String
    var url: String 
}
