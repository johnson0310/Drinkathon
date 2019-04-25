//
//  User+CoreDataProperties.swift
//  Drinkathon
//
//  Created by Johnson on 4/24/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var weight: Int16
    @NSManaged public var numDrinkTipsy: Int16
    @NSManaged public var numDrinkBlackOut: Int16
    @NSManaged public var historicHighBAC: Double
    @NSManaged public var totalNumDrinkSinceInstall: Int32

}
