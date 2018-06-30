//
//  colors.swift
//  Games
//
//  Created by Нурасыл on 29.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import Foundation
import UIKit

struct Colors{
    var name : String?
    var color : UIColor?
    
    init(name: String?, color: UIColor?) {
        self.name = name
        self.color = color
    }
    
    var getName: String? {
        get{
            return name
        }
    }
    
    var getColor: UIColor?{
        get{
            return color
        }
    }
}
