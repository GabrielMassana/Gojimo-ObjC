[![Build Status](https://img.shields.io/travis/GabrielMassana/Gojimo-ObjC/master.svg?style=flat-square)](https://travis-ci.org/GabrielMassana/Gojimo-ObjC)

# Gojimo

[Qualifications API](https://api.gojimo.net/api/v4/qualifications)

# How and why

### Technical Decisions

 - Xcode 7.2
 - Language: Objective-C
 - iOS9
 - iPhone 5/5s/6/6+/6s/6s+
 
### Unit Test

I added some tests to the project to one Parser of the project. I know they are a really small part of the tests that can be added to this project, but they are only trying to be a small example of how powerful they are.

### Continuous Integration

The project is integrated with [Travis-CI](https://travis-ci.org/GabrielMassana/Gojimo-ObjC) as Continuous Integration to automate the build and test of the project.

### Using my own Pods

I used four of [my own pods in Cocoapods](https://cocoapods.org/owners/10374).   
   
- **CoreDataFullStack**. A project to simplify the use of `Core Data`.
- **CoreOperation**. Small wrapper project to simplify `NSOperation` and `NSOperationQueue`.
- **CoreNetworking**. A small project that simplifies `NSURLSession`.
- **ButtonBackgroundColor**. Category to handle the background color of a `UIButton` in normal and highlighted state.
- **ColorWithHex**. Swift Extension to convert hexadecimal values into `UIColor` Objects. This is my first pod in Swift.
	
### Third party Pods

- **[PureLayout](https://cocoapods.org/pods/PureLayout)**. An easy and powerfull pod that helps a lot using auto-layout.

### The app meets all the requirements and optional requirements

#### Requirements

1. Read the following JSON feed containing a list of qualifications
2. Display a list of qualifications based on the data provided by the feed.
3. Allow users to click a qualification to be presented with a list of subjects for that qualification.

#### Optional requirements

i. Using the data provided to its full potential by taking advantage of fields like colour for subjects.
ii. Making the GUI as appealing and responsive as possible.
iii. Storing the data locally and refresh from the server as requested, taking advantage of the HTTP headers to avoid downloads of non-stale data.
iv. Unit testing your code.
