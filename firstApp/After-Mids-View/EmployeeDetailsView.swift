//
//  EmployeeDetailsView.swift
//  firstApp
//
//  Created by apple on 03/01/2025.
//

import Foundation
import SwiftUI

struct EmployeeDetailView: View {
    @State var id: String = ""
    @State var employeeName: String = ""
    @State var dptSelectedText: String = ""
    @State var roleSelectedText: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Employee Details")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            HStack {
                Text("Employee ID:")
                    .font(.headline)
                Spacer()
                Text(id)
                    .font(.body)
            }
            .padding()
            
            HStack {
                Text("Employee Name:")
                    .font(.headline)
                Spacer()
                Text(employeeName)
                    .font(.body)
            }
            .padding()
            
            HStack {
                Text("Department:")
                    .font(.headline)
                Spacer()
                Text(dptSelectedText)
                    .font(.body)
            }
            .padding()
            
            HStack {
                Text("Role:")
                    .font(.headline)
                Spacer()
                Text(roleSelectedText)
                    .font(.body)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    EmployeeDetailView(
        id: "2",
        employeeName: "Ali",
        dptSelectedText: "Traning",
        roleSelectedText: "Trainer"
    )
}
