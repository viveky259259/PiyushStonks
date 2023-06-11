# Baraka Code Challenge

Code task for Baraka

## Getting Started

Unzip the project with any zip tool. Open the project in VSCode and run it. Or just install the apk from ..\flutter_app\build\app\outputs\flutter-apk

## Description

Flutter + Android app that get a list of stocks from a searched ticker and shows the data in a chart. Also gets a list of invested stocks and shows it in a scrollable list
APIs: 
- https://www.alphavantage.co/
- https://run.mocky.io/v3/2b63ba43-6440-4780-aa13-91e6d8247305

## Notes on implementation

- Design architecture MVVM for presentation layer along with Clean architecture adapted design in Android
- Similar approach in Flutter
- Dagger Hilt for dependency injection
- Kotlin and Dart
- Mockito for Unit tests
- Retrofit as a REST cliend for API communication
- Error and loading states
- Kotlin Coroutines. 
- LiveData and ViewModel from Architecture Components
- Mappers to map network objects to domain
- Flutter:
	- MVVM with repository pattern
	- Pigeon library to communicate with Android native
	- syncfusion_flutter_charts library to show the stocks data
	- provider liibrary for app state management
	- easy_search_bar library to select ticket in chart screen

### Improvements

- Due to the lack of time and issues with the finance API I implemented an approach with a different API. There is still left to do the interval buttons and more improvements I will name in this section.
- Use of riverpod to improve the used provider library
- Use of go_router to provide an improvement in flutter navigation.
- Improve the Pigeon result to add an ID and allow multiple replies.
- I have not used persistence for simplicity so Room can be used to create an offline approach and improve the app 
- Design can be definitely improved :)

- Final note: This code task has been a great challenge for me. I have learnt a lot during the implementation considering I am a starter in Flutter if you compare it with my Android native experience. I could have finalized completely with more time but I have already asked for it so I hope you take this into consideration. Regardless, it has been fun!

## Authors

* **Raúl Suárez Rodríguez**