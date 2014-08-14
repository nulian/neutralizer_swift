//
//  RectangleExtensions.swift
//  Neutralizer
//
//  Created by Peter Arentsen on 14-08-14.
//  Copyright (c) 2014 Peter Arentsen. All rights reserved.
//

import SpriteKit

struct RectangleExtensions {
    static func GetBottomCenter(rect: CGRect) -> CGVector{
        return CGVector(rect.origin.x + rect.width / 2.0, rect.minY);
    }
}
