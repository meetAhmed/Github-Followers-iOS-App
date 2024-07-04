//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 04/07/2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUrl = "Invalid url. Please try again."
    case networkError =  "Failed to perform operation."
    case invalidResponse = "Something went wrong at server side."
    case invalidData =  "Data is nil"
    case failedToParseData = "Failed to parse Data."
}
