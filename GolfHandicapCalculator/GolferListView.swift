//
//  GolferListView.swift
//  GolfHandicapCalculator
//
//  Created by Sean Stone on 5/3/25.
//

import SwiftUI

struct GolferListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        fetchRequest: Golfer.fetchAllGolfers(),
        animation: .default)
    private var golfers: FetchedResults<Golfer>

    var body: some View {
        List {
            ForEach(golfers) { golfer in
                VStack(alignment: .leading) {
                    Text(golfer.name ?? "Unnamed")
                    Text("Handicap: \(golfer.handicapIndex, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .onDelete(perform: deleteGolfers)
        }
        .navigationTitle("Golfers")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddGolferView())
            }
        }
    }

    private func deleteGolfers(offsets: IndexSet) {
        withAnimation {
            offsets.map { golfers[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}
