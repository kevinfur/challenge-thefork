# The Fork iOS Technical Test

## Demo
<img src="https://s9.gifyu.com/images/ezgif-2-409c93c629.gif" width="150" />

## Used tools
- Macbook Pro M1
- macOS Monterey 12.0.1
- Xcode 13.4.1
- Cocoapods 1.11.3
- iPhone 13 with iOS 15.5 simulator
- iPhone X with iOS 12.4 simulator

## Instructions
1. Open the terminal
2. cd to project folder 
3. execute `pod install`
4. Open `challenge-thefork.xcworkspace` with Xcode
5. Choose a simulator and click Run

## Assumptions
- Currency is always €

## Clarifications
- Architecture: MVP with dependency injection. Easy to be understood and testable.
- I decided to use only The Fork rating.
- In order for the snapshot tests to succeed you must select an iPhone 13 simulator and it must be in light mode.


# iOS Technical Test - Light version

The main goal of this test is to write a single screen application.

## User Story

### Restaurant list

As a user, I would like to be a able to see a list of restaurants:
- I can scroll through the list of restaurants
- I can see the main picture of each restaurant
- I can find the main information of each restaurant: name, rating, address
- I can see a heart icon for each restaurant indicating whether the restaurant is a favorite or not
- I can see a button providing sort options

### Favorites

As a user:
- I can tap the heart to add or remove the restaurant from my favorites
- If I kill the app, then restart it, I can still see which restaurants are my favorites

### Sort option

As a user:
- When I tap the sort options button, I can chose the sort type to apply
- I can sort restaurants by name
- I can sort restaurants by rating

## Technical instruction

- You should write your application in **Swift**
- Your code should run starting **iOS 12**
- Your views must be defined programmatically (no **xib** nor **storyboard** for cells)
- Restaurants data is accessible on this [JSON file](https://alanflament.github.io/TFTest/test.json) and must be fetched through a network call (Do not add the JSON file to your project)
- Some assets can be found in the archive (images) to help you, however feel free to use any other of your choice

## Work delivery

You should provide the following elements:
- Access to your git repository
- Instructions to build your project
- A brief explanation of the technical choices and potential difficulties

## Evaluation criteria

- Your test compiles and run
- Your implementation can easily be understood by the reviewer
- Your code is well structured and your architecture makes it testable 
- The UI design does not matter, you won't be evaluated on your design skills, but if you want to demonstrate your skills on this topic, go ahead of course :)
- Feel free to add any feature you can imagine, it's your project, the expression of what you want to show us :)

## Deadline

The test is doable in 2 hours, but feel free to spend whatever amount of time you need on it.
The only constraint would be to receive your final project in one week from the moment you received it.
