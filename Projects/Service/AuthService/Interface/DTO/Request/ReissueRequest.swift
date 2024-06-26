//
//  Reissue.swift
//  AuthService
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public struct ReissueRequest: Encodable {
    let refreshToken: String
    
    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
