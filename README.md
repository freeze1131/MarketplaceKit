# Hybrid UIKit + SwiftUI Mobile Architecture

This project demonstrates a production-oriented iOS architecture where **UIKit owns navigation, lifecycle, and screen composition**, while **SwiftUI is embedded as a rendering layer for UI components**.

The goal of this repository is to showcase a realistic approach to gradually adopting SwiftUI in an existing or UIKit-first codebase, rather than building a fully SwiftUI-driven application.

---

## Architecture Overview

* **UIKit**

  * Acts as the application shell
  * Owns `UIWindow`, `UINavigationController`, and screen-level lifecycle
  * Responsible for navigation, dependency wiring, and coordination

* **SwiftUI**

  * Used only for view rendering
  * Embedded inside UIKit using `UIHostingController`
  * Does not own navigation or app lifecycle

This separation allows SwiftUI to be introduced incrementally without sacrificing control over navigation or app flow.

---

## UIKit + SwiftUI Integration

SwiftUI views are embedded inside UIKit view controllers using `UIHostingController`:

* Each screen is a `UIViewController`
* SwiftUI views are treated as child view controllers
* Auto Layout constraints ensure the SwiftUI view fills the screen

This approach ensures:

* Predictable lifecycle behavior
* Compatibility with existing UIKit-based navigation
* Clear ownership boundaries between UI and app logic

---

## Project Structure

* `SceneDelegate`

  * Creates the application window
  * Sets up the root `UINavigationController`

* `ProductListViewController`

  * Screen-level owner
  * Embeds `ProductListView` using `UIHostingController`

* `ProductListView` (SwiftUI)

  * Stateless UI component
  * Responsible only for rendering content

---

## Why This Approach

* Matches real-world UIKit-first production codebases
* Allows gradual SwiftUI adoption
* Keeps navigation and lifecycle explicit and testable
* Avoids coupling SwiftUI views to global app state

This pattern is suitable for large-scale applications where UIKit remains the primary framework, while SwiftUI is leveraged for faster UI development.

---

## Target Use Case

This repository is intended as:

* A reference for hybrid UIKit + SwiftUI architecture
* A demonstration of controlled SwiftUI usage in production
* A portfolio project showcasing architectural decision-making rather than UI complexity

---

## Requirements

* iOS 16+
* Xcode 15+
* Swift 5.9+
