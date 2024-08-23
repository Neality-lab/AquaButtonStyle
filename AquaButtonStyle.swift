//
//  AquaButtonStyle.swift
//  Aqua Button
//
//  Created by Yohey Kuwa on 2024/08/22.
//

import SwiftUI

struct AquaButtonStyle: ButtonStyle {
    var aquaColor: Color
    var colorShadow: Bool
    var highlight: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color.black.opacity(0.7))
            .padding()
            .background(
                GeometryReader { geo in
                    let edgePadding = geo.size.height / 30 // Edge padding based on the button's height
                    
                    ZStack {
                        // Base capsule shape with optional color shadow
                        Capsule()
                            .foregroundStyle(aquaColor.opacity(0.95)) // Main button color
                            .blendMode(.darken)
                            .shadow(radius: edgePadding / 2) // Subtle shadow for depth
                            .shadow(
                                color: colorShadow ? aquaColor.opacity(0.35) : .clear, // Visible only if colorShadow is true
                                radius: colorShadow ? geo.size.height / 20 : 0,
                                y: colorShadow ? geo.size.height / 10 : 0
                            )
                        
                        ZStack {
                            // Light gradient overlay on the capsule
                            Capsule()
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.white.opacity(0), .white.opacity(0.1), .white.opacity(0.3), .white.opacity(0.75)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .blur(radius: edgePadding / 2) // Soften the gradient edges
                            
                            ZStack {
                                // Reflection effect on the capsule
                                Capsule()
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.white.opacity(0.95), .white.opacity(0.5), .white.opacity(0.25), .white.opacity(0), .white.opacity(0)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .mask(
                                        Capsule()
                                            .offset(y: -geo.size.height / 6) // Adjust the position of the reflection
                                            .padding(.vertical, edgePadding * 5)
                                            .padding(.horizontal, edgePadding * 3)
                                    )
                                
                                // Highlight effect applied only if the highlight option is true
                                if highlight {
                                    Capsule()
                                        .foregroundStyle(.white.opacity(0.8))
                                        .mask(
                                            ZStack {
                                                Capsule() // Full-sized capsule for the base of the highlight
                                                
                                                Capsule()
                                                    .offset(y: edgePadding * 1.6) // Slightly offset capsule to create a cut-out effect
                                                    .blendMode(.destinationOut) // Removes the overlapping area, creating a highlight
                                            }
                                            .compositingGroup() // Creates a shape from the non-overlapping areas of the two capsules.
                                            .mask(
                                                // Applies the same mask as the reflection
                                                Capsule()
                                                    .offset(y: -geo.size.height / 6) // Align with reflection
                                                    .padding(.vertical, edgePadding * 5)
                                                    .padding(.horizontal, edgePadding * 3)
                                            )
                                        )
                                }
                            }
                            .blur(radius: edgePadding / 4)
                            .padding(edgePadding)
                        }
                        .padding(edgePadding) // Additional padding for inner ZStack
                    }
                }
            )
            .opacity(configuration.isPressed ? 0.7 : 1.0) // Dim the button when pressed
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0) // Slightly scale down the button when pressed
            .buttonStyle(PlainButtonStyle()) // Ensure the button behaves as a plain button without additional styles
    }
}

extension View {
    func aquaButtonStyle(aquaColor: Color, colorShadow: Bool = true) -> some View {
        self.buttonStyle(AquaButtonStyle(aquaColor: aquaColor, colorShadow: colorShadow))
    }
}
