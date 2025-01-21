//
//  FactedApp.swift
//  Facted
//
//  Created by John Bean on 1/21/25.
//

import SwiftUI

@main
struct FactedApp: App {
	
	@StateObject private var factViewModel: FactViewModel = FactViewModel()
	
    var body: some Scene {
		MenuBarExtra {
            ContentView()
				.environmentObject(factViewModel)
		} label: {
			Label("Facted", systemImage: "text.page.badge.magnifyingglass")
		}
		.menuBarExtraStyle(.window)
    }

}
