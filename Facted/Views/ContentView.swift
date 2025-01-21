//
//  ContentView.swift
//  Facted
//
//  Created by John Bean on 1/21/25.
//

import SwiftUI

struct ContentView: View {
	
	@EnvironmentObject private var factViewModel: FactViewModel
	
    var body: some View {
        VStack {
			Group {
				if let fact = factViewModel.fact {
					Text(fact.text)
				} else {
					Text("Loading...")
				}
			}
        }
		.padding(10)
		.onAppear {
			// Load a fact
			self.loadFact()
		}
    }
	
	private func loadFact() {
		Task {
			await factViewModel.fetchFact()
		}
	}
	
}

#Preview {
    ContentView()
}
