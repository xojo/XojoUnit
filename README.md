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

### Requirements

Xojo 2016 Release 2 or later is required to use XojoUnit with iOS.

### Release Notes

6.7 (____)

- API 2.0.
- Web 2.0.
- Added `Assert.FailCount`, incremented within a test on every failure.

6.6 (Apr. 13, 2020)

- In Desktop, "N/A" tests will show as grey and any test with a message will be bolded.
- Desktop will allow you to filter tests through the command line with either `--includeunittests` or `--excludeunittests` as the last item. Use patterns where "\*" is a wildcard and a dot separates group and test name. Multiple patterns can be separated by commas. Example, `--includeunittests 'MyGroup.A\*'` will only include tests in group MyGroup that start with "A". `--excludeunittests '*.*Broker*'` will exclude any tests in any groups that contain the word "Broker". `--includeunittests 'MyGroup.MyTest'` and `--includeunittests 'MyGroup.My'` will both include only the test named "MyTest" (the "Test" suffix is optional).
- A method that uses DoEvents (used behind the scenes by some Xojo functions) will no longer cause crashes.

6.5 (Jan. 16, 2018)

- Added "Run Until Fail"" button to Desktop. Tests will continue to run in a loop until one fails. "Stop Tests" will stop after the last test if running in a loop, or immediately if not. If you want to stop looping tests right away, press "Stop Tests" twice.
- Added more contextual menus to Desktop (Selected Failed Tests, Select One Test).
- Better updating of results and summary on Desktop. Also means less flicker on Windows.
- Better handling of `Controller.Duration`.
- Added more Currency tests.
- Disabled Run button and added progress wheel to iOS.
- Added Test Timers.

6.4 (Jan. 12, 2018)

- Fixed bug where asynchronous tests will yield time to other TestGroups.
- Desktop will update UI as tests run and allow Stop.
- More Desktop contextual menus.
- Running tests in Desktop with no groups selected will no longer show the useless wheel.
- If the `TestGroup.Setup` event raised an Exception, the Duration would be wrong. No longer.
- Test message in Desktop is now read-only.

6.3 (Dec. 16, 2016)

- Added `TestGroup.StopTestOnFail` property. If `True`, the first Fail will stop a test. A TestGroup can be set to stop when it is first added, it can be set in the `Setup` event, or an individual test can set it for that lone test.
- Modified projects to properly report tests that did not return a result.
- Modified `ExportTestResults` to be more compatible with JUnit.

6.2 (October 21, 2016)

- Added Assert.Matches and Assert.DoesNotMatch to test strings against regular expressions.
- iOS project will show failed method names in red.

6.1 (October 18, 2016)

- Overridden superclass methods will be ignored.
- "Tests" that specify a parameter will be ignored.

6.0.2 (October 6, 2016)

- TestGroup.Constructor no longer requires groupName. Will default to the name of the class if not given.
- Desktop will once again properly run the tests and quit if given the `--rununittests <path>` argument on the command line.
- Export file paths can now contain spaces, but it must be the last argument.

6.0.1 (July 14, 2016)

- Updated iOS project for Xojo 2016r2.

6.0 (July 6, 2016)

- Asynchronous testing is now possible through the `AsyncAwait(maxSeconds)` and `AsyncComplete` methods.
- Projects were refactored to allow asynchronous testing.
- Asynchronous tests added.

5.0 (March 29, 2016)

- TestGroup Setup and TearDown events will run around each test method.
- Every test method will start from a fresh copy of the TestGroup.
- Fixed report indenting.
- Fixed formatting of doubles in Assert.Fail.
- Added "Not Implemented" count and properly update all counts.
- TestGroup now has an UnhandledException event.

4.6.1 (December 22, 2015)

- Desktop version will honor groups that are marked as "Ignore" in code.

4.6 (September 21, 2015)

- Better command-line parsing and options for console version.
- Allow filtering by methods.

4.5.1 (August 27, 2015)

- Messages passed to Assert messages will only show up with the test fails.
- Changed TestController.Version into a Text for compatibility with iOS.
- Bug fixes.

4.5 (June 2015)

- Added iOS.
- Other stuff.

Paul Lefebvre (paul at xojo.com)
