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
    let numberOfLessons: String?
    let numberOfTests: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case link = "Link"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
    
    init(dictCourse: [String: Any]) {
        name = dictCourse["name"] as? String
        link = dictCourse["link"] as? String
        imageUrl = dictCourse["imageUrl"] as? String
        numberOfLessons = dictCourse["numberOfLessons"] as? String
        numberOfTests = dictCourse["numberOfTests"] as? String
    }
    
    static func getCourses(from jsonData: Any) -> [Course] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
        
        var courses: [Course] = []
        for dictCourse in jsonData {
            let course = Course(dictCourse: dictCourse)
            courses.append(course)
        }
        return courses
    }
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
