# AquaButtonStyle

## Description
A customizable SwiftUI button style featuring an Aqua-inspired design. Easily integrate it into your SwiftUI projects for enhanced button appearance.

## Usage
To use `AquaButtonStyle`, apply it to a button with the desired shape and style:

**Capsule Button:**

```swift
Button("Aqua Capsule Button") {
    // Button action
}
.fontWeight(.bold)
.aquaButtonStyle(aquaColor: aquaColor)
```

**Rectangle Button:**

```swift
Button("Aqua Rectangle Button") {
    // Button action
}
.fontWeight(.bold)
.aquaButtonStyle(aquaColor: aquaColor, shape: .rectangle(cornerRadius: 15))
```

This setup demonstrates how to apply the custom button style with either a capsule or rectangle shape.

## Customization Options

You can customize the `AquaButtonStyle` by adjusting the following parameters:

**Color Shadow**: To disable the color shadow, set the `colorShadow` parameter to `false` in the modifier:

  ```swift
  .aquaButtonStyle(aquaColor: .blue, colorShadow: false)
  ```
  
For more details, check the code comments in `AquaButtonStyle.swift`.
