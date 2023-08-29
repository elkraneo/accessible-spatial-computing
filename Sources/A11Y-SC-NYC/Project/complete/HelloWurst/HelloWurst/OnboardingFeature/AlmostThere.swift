import SwiftUI

struct Notification: Identifiable {
  var title: String
  var subtitle: String
  var id: UUID
}

struct AlmostThere: View {
  
  //  @AccessibilityFocusState
  //  var focusedNotification: UUID?
  
  @Environment(OnboardingFeatureModel.self)
  private var model
  
  @State
  var progress = 1.0
  
  let notifications: [Notification] = [
    .init(title: "Finding recipes for your diet", subtitle: "sub", id: UUID()),
    .init(title: "Sorting out ingredients you don't eat", subtitle: "sub", id: UUID()),
    .init(title: "Personalizing your recipes", subtitle: "sub", id: UUID()),
    .init(title: "Ready to go!", subtitle: "sub", id: UUID()),
  ]
  
  var body: some View {
    List {
      Section {
        VStack {
          withAnimation {
            Text(model.isReady ? "Ready to go!" : "You're almost there!")
              .font(.system(.title, design: .serif))
              .bold()
              .multilineTextAlignment(.center)
              .animation(.default, value: model.isReady)
              .accessibilityAddTraits(.updatesFrequently)
            
            // .accessibilityFocused($focusedNotification, equals: notifications[3].id)
          }
          
          Spacer()
          
          withAnimation {
            VStack(alignment: .leading, spacing: 8) {
              let isFirstStepCompleted = progress < 0.8
              Label("Finding recipes for your diet", systemImage: "checkmark.circle.fill")
                .foregroundStyle(.primary, isFirstStepCompleted ? Color.accentColor : .secondary)
                .opacity(isFirstStepCompleted ? 1 : 0.25)
                .animation(.easeInOut, value: progress)
                .offset(y: isFirstStepCompleted ? -5 : 0)
              //            .accessibilityFocused($focusedNotification, equals: notifications[0].id)
              
              let isSecondStepCompleted = progress < 0.5
              Label("Sorting out ingredients you don't eat", systemImage: "checkmark.circle.fill")
                .foregroundStyle(.primary, isSecondStepCompleted ? Color.accentColor : .secondary)
                .opacity(isSecondStepCompleted ? 1 : 0.25)
                .animation(.easeInOut, value: progress)
                .offset(y: isSecondStepCompleted ? -5 : 0)
              // .accessibilityFocused($focusedNotification, equals: notifications[1].id)
              
              let isThirdStepCompleted = progress < 0.2
              Label("Personalizing your recipes", systemImage: "checkmark.circle.fill")
                .foregroundStyle(.primary, isThirdStepCompleted ? Color.accentColor: .secondary)
                .opacity(isThirdStepCompleted ? 1 : 0.25)
                .animation(.easeInOut, value: progress)
                .offset(y: isThirdStepCompleted ? -5 : 0)
              // .accessibilityFocused($focusedNotification, equals: notifications[2].id)
            }
            .accessibilityHidden(true)
            .padding(.top)
          }
        }
        .listRowSeparator(.hidden)
      } header: {
        VStack {
          Spacer()
            .frame(width: .zero, height: 0)
            .accessibilityLabel("Step 4 of 4")
          
          Image(decorative: "wursthain")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay {
              withAnimation {
                Circle()
                  .trim(from: 0.0, to: progress)
                  .stroke(style: StrokeStyle(lineWidth: 16.0, lineCap: .round, lineJoin: .round))
                  .foregroundColor(.accentColor)
                  .rotationEffect(Angle(degrees: 270.0))
                  .animation(.easeInOut, value: progress)
                  .accessibilityLabel(Text("Process"))
                  .accessibilityAddTraits(.updatesFrequently)
                  .accessibilityValue(Text("\(progress)"))
                  .accessibilitySortPriority(1)
              }
            }
        }
        .padding()
      }
    }
    .listStyle(.plain)
    .toolbar {
      ToolbarItem(placement: .bottomBar) {
        Button(
          action: { model.onboardingDidComplete() },
          label: {
            Text("Finally".uppercased())
              .bold()
              .frame(maxWidth: .infinity)
          }
        )
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
        .disabled(!model.isReady)
        .accessibilityHint(model.isReady ? "Complete the onboarding process and find today's recipes tailored to you." : "")
      }
    }
    .task {
      // focusedNotification = notifications[3].id
      Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
        progress -= Double.random(in: 0.001...0.05)
        if progress <= 0 {
          timer.invalidate()
          model.onboardingIsReady()
        }
        
        //        switch progress {
        //        case -(Double.infinity)..<0:
        //          timer.invalidate()
        //          isReady = true
        //          guard focusedNotification != notifications[3].id else { return }
        //          focusedNotification = notifications[3].id
        //          print("3")
        
        
        //        case 0..<0.2:
        //          guard focusedNotification != notifications[2].id else { return }
        //          print("2", focusedNotification)
        //          focusedNotification = notifications[2].id
        //
        //        case 0.2..<0.5:
        //          print("_pre 1", focusedNotification)
        //          guard focusedNotification != notifications[1].id else { break }
        //          focusedNotification = notifications[1].id
        //          print("post 1", focusedNotification)
        //          print("noti 1", notifications[1].id)
        //
        //        case 0.5..<0.8:
        //          guard focusedNotification != notifications[0].id else { return }
        //          print("0", focusedNotification)
        //          focusedNotification = notifications[0].id
        
        //        default:
        //          return
        //        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    AlmostThere()
      .environment(OnboardingFeatureModel())
  }
}
