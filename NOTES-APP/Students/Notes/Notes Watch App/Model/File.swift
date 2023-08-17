//
//  File.swift
//  Notes Watch App
//
//  Created by Juan Bazan Carrizo on 27/07/2023.
//

import Foundation


struct Note: Identifiable, Codable, Hashable {
    let id: UUID
    let text: String
}
