//: [Previous](@previous)
//: # ii. Loading image using binary data download
//: Importing our core libraries
import Foundation
//: Importing UI-related classes for displaying image later
import UIKit
//: Importing Playground-related classes for displaying UI in playground
import PlaygroundSupport
//: Create a URL object from string. Again, note the `!` at the end
let url = URL(string: "https://via.placeholder.com/600/92c952")!
//: Downloading the data from the URL
let data = try Data(contentsOf: url)
//: Creating an image object from downloaded data
let image = UIImage(data: data)
//: Creating a UI view to display image object
let view = UIImageView(image: image)
//: Connecting this playground with the UI view
PlaygroundPage.current.liveView = view

//: ## Exercise
//: Find another url of any picture using your favorite web search engine. Load it using the Data and display
//: in the playground.

// your code here

//: [Next](@next)
    
