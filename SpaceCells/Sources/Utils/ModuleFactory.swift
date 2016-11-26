//
//  ModuleFactory.swift
//  SpaceCells
//
//  Created by Mario on 22/11/16.
//  Copyright © 2016 Mario Negro. All rights reserved.
//

import UIKit

protocol ModuleFactory {
    static func create(withMainRouter mainRouter: MainRouter) -> UIViewController
}
