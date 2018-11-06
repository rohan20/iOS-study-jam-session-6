//: [Previous](@previous)
//: # iv. Loading image asynchronously

import Foundation
import UIKit
import PlaygroundSupport

//: Create an activity indicator - progress indicator
let spinner = UIActivityIndicatorView(style: .whiteLarge)
//: Start the indicator spinning
spinner.startAnimating()
//: Connect the indicator to the playground
PlaygroundPage.current.liveView = spinner
//: Create URL, session and task...
let url = URL(string: "https://via.placeholder.com/600/92c952")!
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)
//: The task's copmletion block is always called in a background thread by default. Therefore, if you'd like to
//: use UI-related classes (UIView, controllers and others), then you have to switch to a main thread.
//: See comments below.
let task = session.dataTask(with: url) { data, response, error in
//: If data exists and can be converted into an image
    if let data = data, let image = UIImage(data: data) {
//: Switch to the main thread to actually do UI stuff
        DispatchQueue.main.async {
//: Same as before, create an image view and connect it to the playground
            let view = UIImageView(image: image)
            PlaygroundPage.current.liveView = view
        }
    }
}
//: Start created task
task.resume()

//: ## Exercise
//: Find any other image on the Internet and display it using the URLSession approach.
//: Bonus: Can you somehow manipulate image display? Let's say, cut it into a circle shape?

// your code here

//: [Next](@next)
