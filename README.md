XojoUnit
========

A Unit Testing framework for Xojo. 

## How to Use

Refer to the wiki for usage instructions and an example.

https://github.com/xojo/XojoUnit/wiki

## How to contribute

You can contribute to XojoUnit in two ways:

* submit changes from your Fork of XojoUnit
* request to become a Contributor

Don't send me emails with your updated project.

### Forking XojoUnit

1. Click the Fork button at the top.
2. Make your changes.
3. Push your changes back to GitHub.
4. Create a "Pull Request" for your changes.

These steps notify the XojoUnit maintainers so that the change can be reviewed for inclusion in XojoUnit.

Here is a helpflow Github workflow document I found:
http://www.eqqon.com/index.php/Collaborative_Github_Workflow

Frankly, this is all still new to me so we'll see how it goes!

### Becoming a Contributor

If you actively submit good changes, I'll probably make you a Contributor so that I don't have to process all your pull requests.

### Release Notes

4.5 (June 2015)

- Added iOS.
- Other stuff.

4.5.1 (August 27, 2015)

- Messages passed to Assert messages will only show up with the test fails.
- Changed TestController.Version into a Text for compatibility with iOS.
- Bug fixes.

4.6 (September 21, 2015)

- Better command-line parsing and options for console version.
- Allow filtering by methods.

4.6.1 (December 22, 2015)

- Desktop version will honor groups that are marked as "Ignore" in code.

5.0 (March 29, 2016)

- TestGroup Setup and TearDown events will run around each test method.
- Every test method will start from a fresh copy of the TestGroup.
- Fixed report indenting.
- Fixed formatting of doubles in Assert.Fail.
- Added "Not Implemented" count and properly update all counts.
- TestGroup now has an UnhandledException event.

6.0 (July 6, 2016)

- Asynchronous testing is now possible through the `AsyncAwait(maxSeconds)` and `AsyncComplete` methods.
- Projects were refactored to allow asynchronous testing.
- Asynchronous tests added.

6.0.1 (July 14, 2016)

- Updated iOS project for Xojo 2016r2.

6.0.2 (October 6, 2016)

- TestGroup.Constructor no longer requires groupName. Will default to the name of the class if not given.
- Desktop will once again properly run the tests and quit if given the `--rununittests <path>` argument on the command line.
- Export file paths can now contain spaces, but it must be the last argument.

6.1 (October 18, 2016)

- Overridden superclass methods will be ignored.
- "Tests" that specify a parameter will be ignored.

Paul Lefebvre (paul@xojo.com)
