//
//  ReusableController.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import UIKit

// MARK: - ReusableController
/// ReusableController use to obtain ViewController idenfifier and instantiate
/// Detail Description: A view controller that is on storyboard
protocol ReusableController: UIViewController {
    
    associatedtype ObjectController
    static var identifier: String { get }
    static func instantiate(name: StoryboardType) -> ObjectController
}

extension ReusableController {
    /// ViewController identifier by its name
    static var identifier: String {
        String(describing: self)
    }
    
    /// Instantiates  View Controller that is on storyboard
    static func instantiate(name: StoryboardType) -> ObjectController {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: self.identifier) as? ObjectController else {
            fatalError("Unable to instantiate with identifier: \(self.identifier)")
        }
        return viewController
    }
}
