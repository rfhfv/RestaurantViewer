
# RestaurantViewer

iOS restaurant discovery app built with SwiftUI and the MVVM architecture.  
The app displays a stack of restaurant cards, loads data from the Yelp API based on the user's location, and supports infinite scrolling.

## Preview

https://github.com/user-attachments/assets/7bd8cc37-fbdb-4223-b337-7e154f80b173

## Features

- Current location detection
- Restaurant card stack with smooth animations
- Next/Previous navigation
- Asynchronous image loading
- Infinite scrolling (loads more restaurants automatically)
- Rating display
- Built-in loading states

## Tech Stack

- SwiftUI
- MVVM Architecture
- CoreLocation
- Combine
- URLSession
- Yelp Fusion API

## Architecture

The project is divided into several layers:

- **Views**: SwiftUI views for the card stack and individual cards.
- **ViewModels**: Handles business logic, state management, and user actions.
- **Services**: Encapsulates networking (`YelpAPI`) and location services (`LocationManager`).
- **Models**: Defines the `Restaurant` data model and the API response structure.

The app uses `@StateObject` for view state management and dependency injection to pass the API service to the ViewModel.

## Setup Instructions
- git clone https://github.com/rfhfv/RestaurantViewer.git
- cd RestaurantViewer
  
## Write-Up

- How long did you spend? What was the most difficult part?
  
I spent about 4-5 hours. I worked a bit with LocationManager, so understanding delegates and permissions took some time.

- What trade-offs did you make?
  
I focused on card stack UI, smooth animations, and MVVM architecture. I skipped full error handling, unit tests, and pull-to-refresh due to time.

- Extra improvements?
  
Added directional slide animations, depth effect (background cards at 0.95 scale), infinite pagination, and optimized LocationManager to stop updating after getting location.
