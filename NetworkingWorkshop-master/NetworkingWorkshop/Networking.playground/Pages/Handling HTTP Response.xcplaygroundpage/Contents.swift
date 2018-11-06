//: [Previous](@previous)
//: # v. Handling HTTP requests and responses
import Foundation

/*:
 `URLSession` APIs allow to create custom URL requests and handle different HTTP responses.
 Three classes that are responsible for that are called `URLRequest`, `URLResponse`, and `HTTPURLResponse`.
 You can configure a `URLRequest` with various parameters, such as HTTP method, request body and headers.
 Similarly, you can check `HTTPURLResponse` to get its header information, body and status.
*/

//: Let's suppose we'd like to change one post's title.
//: To do this, we'd like to use a REST endpoint /posts/<id> with a PATCH HTTP method.
//: Let's configure the request.

let postID = 1
//: Compose the URL. NOTE: security caveat: what is wrong with this line?
let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postID)")!
//: Create new variable request object with the url
var request = URLRequest(url: url)
//: Set up HTTP method.
request.httpMethod = "PATCH"
//: Set up the content type so that the server knows what to expect in the request's body
request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
//: We declare here a `PostChange` struct that we use for the request payload to change post's title
struct PostChange: Codable {
    var title: String
}
//: After the declaration, we create the struct with concrete data that we want to submit
let newTitle = PostChange(title: "My New Title")
//: Convert the struct into JSON string binary data
let jsonData = try JSONEncoder().encode(newTitle)
//: Put the data inside the URL request
request.httpBody = jsonData

//: Request is ready now, then let's create the URL session.
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

//: We declare the response object struct that we expect to receive from the server as JSON.
struct Post: Codable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}

//: Create the data task
let task = session.dataTask(with: request) { data, response, error in
    if let data = data {
//: Note that we are inside the DataTask's completion handler which cannot handle errors thrown from here.
//: That's why we have to wrap our potentially throwing code (`try ...`) with `do ... catch` construct
        do {
//: Let's convert the binary JSON data into struct
            let post = try JSONDecoder().decode(Post.self, from: data)
//: Debug printing here
            print(post)
        } catch let decodingError {
//: In case we  encounter errors, log them in the console.
            print("Decoding failed: \(decodingError)")
        }
    }
}
//: Start the data task
task.resume()

//: ## Exercise
//: Instead of chaning posts's title, change its body.
//: Bonus: Can you delete the post?
//: Extra bonus: Can you create, change, complete or delete a `/todos` item? [Server output](http://jsonplaceholder.typicode.com/todos)

// your code here

//: [Next](@next)
