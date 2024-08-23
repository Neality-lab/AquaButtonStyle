# AquaButtonStyle
A customizable SwiftUI button style featuring an Aqua-inspired design. Easily integrate it into your SwiftUI projects for enhanced button appearance.

### Basic Usage

To use `AquaButtonStyle` in your SwiftUI project, apply it to your buttons like so:

```swift
Button("Aqua Button") {
    // Action
}
.aquaButtonStyle(aquaColor: .blue)
```

### Customization Options

You can customize the `AquaButtonStyle` by adjusting the following parameters:

- **Color Shadow**: To disable the color shadow, set the `colorShadow` parameter to `false` in the modifier:

  ```swift
  .aquaButtonStyle(aquaColor: .blue, colorShadow: false)
  ```
  
For more details, check the code comments in `AquaButtonStyle.swift`.
