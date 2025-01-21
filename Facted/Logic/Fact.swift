//
//  Fact.swift
//  Facted
//
//  Created by John Bean on 1/21/25.
//

import Foundation

struct Fact: Codable {
	
	// MARK: - Properties
	
	/// The unique identifier of the fact.
	let id: String
	/// The text of the fact.
	let text: String
	/// The source of the fact.
	let source: String
	/// The URL of the source of the fact.
	let sourceURL: String
	/// The language of the fact.
	let language: String
	/// The permalink of the fact.
	let permalink: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case text
		case source
		case sourceURL = "source_url"
		case language
		case permalink
	}
	
}
