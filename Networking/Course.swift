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
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
