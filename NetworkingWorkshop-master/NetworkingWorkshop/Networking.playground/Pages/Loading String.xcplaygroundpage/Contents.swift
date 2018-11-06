//: # i. Loading String contents from a URL
//: Service documentation at [JSON Placeholder](http://jsonplaceholder.typicode.com/posts)
import Foundation
//: Create a URL object. Note the `!` at the end - by this, we tell the compiler: we guarantee that the URL has valid format.
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//: Load content of the URL synchronously. If you use this code in a UIViewController, for example, then the UI will
//: freeze for the duration of URL loading.
let postsJSON = try String(contentsOf: url)
//: Print the string contents to the console
print(postsJSON)

//: ## Exercise
//: Find another URL on the website [JSON Placeholder](http://jsonplaceholder.typicode.com/posts), and print
//: its server's output to the console.

// your code here

//: [Next](@next)
