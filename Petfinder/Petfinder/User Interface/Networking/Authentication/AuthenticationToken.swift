//
//  AuthenticationToken.swift
//  TuneBrowse
//
//  Created by Calin Drule on 10.10.2022.
//

import Foundation

struct AuthenticationToken: Decodable {
    var tokenType: String // TODO: convert to enum
    var expiresIn: Int
    var accessToken: String
    
    
    private enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}
