//
//  ProspectsList.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftData
import SwiftUI

struct ProspectsList: View {
    @Environment(\.modelContext) var modelContext
    @Query var prospects: [Prospect]
    
    @Binding public var selectedProspects: Set<Prospect>
    public var addNotification: (Prospect) -> Void
    
    var body: some View {
        List(selection: $selectedProspects) {
            ForEach(prospects) { prospect in
                NavigationLink {
                    ProspectEditView(prospect: prospect)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(prospect.name)
                                .font(.headline)
                            if prospect.isContacted == true {
                                Image(systemName: "person.crop.circle.badge.checkmark")
                                    .foregroundColor(.green)
                            }
                        }
                        Text(prospect.dateAdded, style: .relative)
                        Text(prospect.emailAddress)
                            .foregroundStyle(.secondary)
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    if prospect.isContacted {
                        Button("Mark uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark contacted", systemImage: "person.crop.circle.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                        Button("Remind me", systemImage: "bell") {
                            addNotification(prospect)
                        }
                        .tint(.orange)
                    }
                }
                .tag(prospect)
            }
        }
    }
    
    init(sort: [SortDescriptor<Prospect>], type: FilterType, selectedProspects: Binding<Set<Prospect>>, addNotification: @escaping (Prospect) -> Void) {
        
        // Set the query
        switch type {
        case .none:
            _prospects = Query(sort: sort)
        case .contacted:
            _prospects = Query(filter: #Predicate {
                $0.isContacted == true
            }, sort: sort)
        case .uncontacted:
            _prospects = Query(filter: #Predicate {
                $0.isContacted == false
            }, sort: sort)
        }
        
        // Set other properties
        _selectedProspects = selectedProspects
        self.addNotification = addNotification
    }

}

#Preview {
    ProspectsList(
        sort: [SortDescriptor(\Prospect.name)],
        type: .none,
        selectedProspects: .constant(Set<Prospect>()),
        addNotification: { _ in }
    )
        .modelContainer(for: Prospect.self)
}
