//
//  DetailViewController.swift
//  NetworkingWorkshop
//
//  Created by Dmitry Bespalov on 06.11.18.
//  Copyright © 2018 Example Org. All rights reserved.
//

import UIKit

extension MyService {

    func loadImage(_ url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return nil }
        return image
    }

}

class DetailViewController_completed: UIViewController {

    @IBOutlet weak var loadingStackView: UIStackView!
    @IBOutlet weak var contentStackView: UIStackView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    var isLoading = false
    var service = MyService()

    func loadData() {
        guard let id = detailItem, isViewLoaded else { return }
        guard !isLoading else { return }
        isLoading = true
        loadingStackView.isHidden = false
        contentStackView.isHidden = true

        DispatchQueue.global().async { [weak self] in
            guard let `self` = self else { return }
            self.isLoading = false
            guard let post = self.service.loadPost(id: id),
                let photo = self.service.loadPhoto(id: id) else {
                    self.showError()
                    return
            }
            self.updateView(photo, post)
        }
    }

    func showError() {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: "Error loading data", message: nil, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(controller, animated: true, completion: nil)
        }
    }

    func updateView(_ photo: Photo, _ post: Post) {
        let image = service.loadImage(photo.url)
        DispatchQueue.main.async {
            self.loadingStackView.isHidden = true
            self.contentStackView.isHidden = false
            self.titleLabel.text = post.title
            self.bodyLabel.text = post.body
            self.photoImageView.image = image
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
    }

    var detailItem: Int? {
        didSet {
            // Update the view.
            loadData()
        }
    }


}
