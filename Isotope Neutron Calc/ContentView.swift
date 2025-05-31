//
//  ContentView.swift
//  Isotope Neutron Calc
//
//  Created by Omar Ahmed on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    let elements = periodicTable.keys.sorted()
    @State private var selectedSymbol: String = "H"
    @State private var massNumber: String = ""
    @State private var result: String = ""
    
    var validationMessage: String {
		guard let z = periodicTable[selectedSymbol] else {
			return "Invalid element selected"
		}
		
		guard let a = Int(massNumber), a > 0 else {
			return "Enter a valid positive number"
		}
		
		if a < z {
			return "Mass number must be ≥ atomic number (\(z))"
		}
		
		return ""
	}

    var body: some View {
		NavigationView {
			VStack(spacing: 20) {
				Text("Select an Element for X")
					.font(.title2)
					.padding(.top)

				Picker("Select Element", selection: $selectedSymbol) {
					ForEach(elements, id: \.self) { symbol in
						Text(symbol)
					}
				}
				.pickerStyle(WheelPickerStyle())
				.padding()

				TextField("Enter mass number (e.g., 180)", text: $massNumber)
					.keyboardType(.numberPad)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.padding(.horizontal)
				
				Text(validationMessage)
					.foregroundColor(.red)
					.font(.caption)
					.padding(.horizontal)

				Button("Calculate Neutrons") {
					hideKeyboard()
					
					guard let z = periodicTable[selectedSymbol] else {
						result = "Element not found"
						return
					}
					
					guard let a = Int(massNumber), a > 0 else {
						result = "Please enter a valid positive number"
						return
					}
					
					guard a >= z else {
						result = "Mass number must be greater than or equal to atomic number (\(z))"
						return
					}
					let neutrons = a - z
					result = "\(neutrons) neutrons in \(selectedSymbol)-\(a)"
				}
				.padding()

				Text(result)
					.font(.body)
					.multilineTextAlignment(.center)
					.padding()
					
				NavigationLink(destination: EducationView()) {
					Text("Learn About Isotopes")
						.foregroundColor(.blue)
						.padding()
				}

				Spacer()
			}
			.padding()
			.onTapGesture {
				hideKeyboard()
			}
			.navigationTitle("Isotope Neutron Calculator")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

// MARK: - Keyboard Dismissal Helper
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
#endif
