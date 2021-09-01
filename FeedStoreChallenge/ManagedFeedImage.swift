//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by GD on 9/2/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

class ManagedFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedCache
}
