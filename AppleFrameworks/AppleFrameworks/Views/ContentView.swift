//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 17/09/24.
//

import SwiftUI

import Combine
import SwiftUI

import SwiftUI

struct Vehicle: Identifiable {
    let id = UUID()
    let brand: String
    let name: String
    let type: VehicleType
}

enum VehicleType: String, CaseIterable, Identifiable {
    case car = "Car"
    case motorcycle = "Motorcycle"
    case truck = "Truck"
    
    var id: String { self.rawValue }
}

class VehicleViewModel: ObservableObject {
    @Published var vehicles: [Vehicle] = [
        Vehicle(brand: "Tesla", name: "Model S", type: .car),
        Vehicle(brand: "Ford", name: "F-150", type: .truck),
        Vehicle(brand: "Harley Davidson", name: "Street 750", type: .motorcycle),
        Vehicle(brand: "Chevrolet", name: "Silverado", type: .truck),
        Vehicle(brand: "Honda", name: "Civic", type: .car),
        Vehicle(brand: "Yamaha", name: "MT-09", type: .motorcycle)
    ]
    
    // Function to group vehicles by type
    func vehiclesByType() -> [VehicleType: [Vehicle]] {
        Dictionary(grouping: vehicles) { $0.type }
    }
}

struct VehicleListView: View {
    @StateObject private var viewModel = VehicleViewModel()

    var body: some View {
        List {
            ForEach(VehicleType.allCases, id: \.id) { vehicleType in
                Section(header:
                    VStack(alignment: .leading) {
                            Text(vehicleType.rawValue)
                                .background(.blue)
                                .padding(.bottom, 20) // Add spacing between title and rows
                    }
                   
                ) {
                    ForEach(viewModel.vehiclesByType()[vehicleType] ?? [], id: \.id) { vehicle in
                        VehicleRow(vehicle: vehicle)
                            .background(.red)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)) // 20 points between rows
                    }
                }
                .listSectionSeparator(.hidden) // Hide section separator if needed
            }
        }
        .listStyle(PlainListStyle())
        .listRowSeparator(.hidden)
        .padding(.horizontal, 0)
        .navigationTitle("Vehicles")
    }
}

struct VehicleRow: View {
    let vehicle: Vehicle
    
    var body: some View {
        HStack {
            Text(vehicle.brand)
                .font(.headline)
            Spacer()
            Text(vehicle.name)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 0)
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hi")
    }
}
