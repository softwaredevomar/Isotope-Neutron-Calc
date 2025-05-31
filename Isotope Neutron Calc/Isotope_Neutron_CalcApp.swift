//
//  Isotope_Neutron_CalcApp.swift
//  Isotope Neutron Calc
//
//  Created by Omar Ahmed on 5/30/25.
//

import SwiftUI

@main
struct Isotope_Neutron_CalcApp: App {
	@State private var showSplash = true

    var body: some Scene {
        WindowGroup {
			if showSplash {
				SplashView()
					.onAppear {
						DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
							withAnimation {
								self.showSplash = false
							}
						}
					}
			} else {
				ContentView()
            }
        }
    }
}
