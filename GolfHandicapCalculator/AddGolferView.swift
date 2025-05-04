//
//  AddGolferView.swift
//  GolfHandicapCalculator
//
//  Created by Sean Stone  on 5/3/25.
//

import SwiftUI

struct AddGolferView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var handicapIndex: Double = 0.0

    var body: some View {
        Form {
            TextField("Name", text: $name)
            Stepper(value: $handicapIndex, in: 0...54, step: 0.1) {
                Text("Handicap Index: \(handicapIndex, specifier: "%.1f")")
            }
            Button("Save") {
                let newGolfer = Golfer(context: viewContext)
                newGolfer.id = UUID()
                newGolfer.name = name
                newGolfer.handicapIndex = handicapIndex
                try? viewContext.save()
                dismiss()
            }
        }
        .navigationTitle("Add Golfer")
    }
}
