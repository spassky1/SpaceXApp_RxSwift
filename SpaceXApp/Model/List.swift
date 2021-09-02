//
//  Model.swift
//  SpaceXApp
//
//  Created by Arda on 24.08.2021.
//

import Foundation
import SimpleApiClient

struct List: SimpleApi{
     
    var path: String {
        return "/v2/launches"
    }
    
    var method: HTTPMethod {
        return .get
    }
}

extension SimpleApiClient {
    func listRockets() -> Observable<[Data]>  {
        return request(api: List())
    }
}

