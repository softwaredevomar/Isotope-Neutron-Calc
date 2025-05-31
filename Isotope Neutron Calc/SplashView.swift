//
//  SplashView.swift
//  Isotope Neutron Calc
//
//  Created by Omar Ahmed on 5/31/25.
//

import SwiftUI

struct SplashView: View {
	var body: some View {
		ZStack {
			Color.teal.edgesIgnoringSafeArea(.all)
			
			VStack {
				Text("Isotope Neutron Calc")
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(.white)
					.padding(.bottom, 5)
				
				Text("Loading...")
					.font(.headline)
					.foregroundColor(.white.opacity(0.8))
			}
		}
	}
}

struct SplashView_Previews: PreviewProvider {
	static var previews: some View {
		SplashView()
	}
}
