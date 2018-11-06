//: [Previous](@previous)
//: # iii. Simple URLSession example
import Foundation
//: Create a URL
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//: Create a session configuration
let config = URLSessionConfiguration.default
//: Create new session
let session = URLSession(configuration: config)
//: Create new data task - short-lived loading of data in memory. The data received and passed into completion block
let task = session.dataTask(with: url) { data, response, error in
//: If data exists, convert it to a String using UTF8 encoding
    if let data = data, let string = String(data: data, encoding: .utf8) {
//: Print string in the console
        print(string)
    }
}
//: Start created task
task.resume()

//: ## Exercise
//: Load and print `/albums` endpoint using URLSession's data task

//: [Next](@next)
