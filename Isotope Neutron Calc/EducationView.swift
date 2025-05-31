//
//  EducationView.swift
//  Isotope Neutron Calc
//
//  Created by Omar Ahmed on 5/30/25.
//

import SwiftUI

struct EducationView: View {
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				Text("What is an Isotope?")
					.font(.title2)
					.bold()
				Text("Isotopes are atoms of the same element that have different numbers of neutrons. This means they have the same atomic number (Z) but different mass numbers (A).")
				Text("Example")
					.font(.title2)
					.bold()
				Text("Carbon-12 and Carbon-13 are both isotopes of carbon. They have 6 protons, but Carbon-12 has 6 neutrons and Carbon-13 has 7.")
				Text("Fun Fact")
					.font(.title2)
					.bold()
				Text("Some isotopes are radioactive and are used in medicine, like Iodine-131 for treating thyroid conditions.")
			}
			.padding()
		}
		.navigationTitle("Learn Chemistry")
		.navigationBarTitleDisplayMode(.inline)
	}
}
