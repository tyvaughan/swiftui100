//
//  ApiResponse.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/25/24.
//

import Foundation

struct ApiResponse<T> {
    let status: ApiStatus
    let result: T?
}
