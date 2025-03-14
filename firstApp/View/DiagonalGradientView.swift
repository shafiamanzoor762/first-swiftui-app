//
//  DiagonalGradientView.swift
//  firstApp
//
//  Created by apple on 09/12/2024.
//

import SwiftUI

struct DiagonalSplitView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.closeSubpath()
                }
                .fill(Color.blue) // Fill with the first color
                
                // Second triangle (bottom-right)
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    path.move(to: CGPoint(x: width, y: 0)) // Top-right corner
                    path.addLine(to: CGPoint(x: width, y: height)) // Bottom-right corner
                    path.addLine(to: CGPoint(x: 0, y: height)) // Bottom-left corner
                    path.closeSubpath()
                }
                .fill(Color.green) // Fill with the second color
            }
            .ignoresSafeArea() // Ensure the shapes cover the entire screen
        }
    }
}


#Preview {
    DiagonalSplitView()
}
