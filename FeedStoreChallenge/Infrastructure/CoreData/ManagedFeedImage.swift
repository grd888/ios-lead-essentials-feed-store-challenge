//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by GD on 9/2/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedCache
}

extension ManagedFeedImage {
	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}

	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { feed in
			let managedFeedImage = ManagedFeedImage(context: context)
			managedFeedImage.id = feed.id
			managedFeedImage.imageDescription = feed.description
			managedFeedImage.location = feed.location
			managedFeedImage.url = feed.url
			return managedFeedImage
		})
	}
}
