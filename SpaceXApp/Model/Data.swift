//
//  List.swift
//  SpaceXApp
//
//  Created by Arda on 24.08.2021.
//

import Foundation

struct Data: Decodable {
    var rocket: Rockets!
    var mission_name: String!
    var launch_year: String!
    var links: Links!
    var details: String?

    private enum CodingKeys: String, CodingKey{
        case rocket = "rocket"
        case mission_name = "mission_name"
        case launch_year = "launch_year"
        case links = "links"
        case details = "details"
    }
}

struct Rockets: Decodable {
    var rocket_id : String?
    var rocket_name : String?
    var rocket_type : String?

    private enum CodingKeys: String, CodingKey{

        case rocket_id = "rocket_id"
        case rocket_name = "rocket_name"
        case rocket_type = "rocket_type"
    }
}

struct Links: Decodable {
    var mission_patch : String?
    var mission_patch_small : String?
    var flickr_images: [String]

    private enum CodingKeys: String, CodingKey{

        case mission_patch = "mission_patch"
        case mission_patch_small = "mission_patch_small"
        case flickr_images = "flickr_images"
    }
}
