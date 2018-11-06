//
//  MyService.swift
//  NetworkingWorkshop
//
//  Created by Dmitry Bespalov on 06.11.18.
//  Copyright © 2018 Example Org. All rights reserved.
//

import Foundation

struct Post: Codable {
    var id: Int
    var title: String
    var body: String
}

struct Photo: Codable {
    var title: String
    var url: URL
    var thumbnailUrl: URL
}

class MyService {

    func loadPost(id: Int) -> Post? {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)"),
            let data = try? Data(contentsOf: url),
            let post = try? JSONDecoder().decode(Post.self, from: data) else { return nil }
        return post
    }

    func loadPhoto(id: Int) -> Photo? {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos/\(id)"),
            let data = try? Data(contentsOf: url),
            let post = try? JSONDecoder().decode(Photo.self, from: data) else { return nil }
        return post
    }

}
