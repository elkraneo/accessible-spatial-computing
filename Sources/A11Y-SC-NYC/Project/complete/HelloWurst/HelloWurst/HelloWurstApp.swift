import SwiftUI

@main
struct HelloWurstApp: App {
  @State private var model = AppCoreFeatureModel(recipes: Recipe.mock)
  @State private var preferences = Preferences()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(model)
        .environment(preferences)
    }
    
#if os(visionOS)
    WindowGroup.init(id: "Clock") {
      ClockView()
    }
    .windowStyle(.volumetric)
#endif
  }
}
