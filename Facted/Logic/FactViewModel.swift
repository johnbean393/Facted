//
//  FactViewModel.swift
//  Facted
//
//  Created by John Bean on 1/21/25.
//

import Foundation

@MainActor
/// View model for fetching facts
class FactViewModel: ObservableObject {
	
	@Published var fact: Fact? = nil
	@Published var isLoading = false
	
	/// Fetch a random fact
	public func fetchFact() async {
		// Set loading
		isLoading = true
		// Fetch a random fact
		do {
			let fact = try await Self.FactService.shared.fetchRandomUselessFact()
			self.fact = fact
		} catch {
			print("Failed to fetch fact: \(error.localizedDescription)")
		}
		// Unset loading
		isLoading = false
	}
	
	/// Service for fetching facts
	private class FactService {
		
		/// Singleton
		static public let shared = FactService()
		
		/// Function to fetch a random fact
		public func fetchRandomUselessFact() async throws -> Fact {
			let urlString = "https://uselessfacts.jsph.pl/api/v2/facts/random?language=en"
			guard let url = URL(string: urlString) else {
				throw URLError(.badURL)
			}
			
			var request = URLRequest(url: url)
			request.setValue("application/json", forHTTPHeaderField: "Accept")
			
			let (data, _) = try await URLSession.shared.data(for: request)
			return try JSONDecoder().decode(Fact.self, from: data)
		}
		
	}
	
}
