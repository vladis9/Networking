//
//  Course.swift
//  Networking
//
//  Created by Vlad Zinevich on 16.08.2021.
//


struct Course: Decodable {
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
