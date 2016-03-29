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

Paul Lefebvre (paul@xojo.com)
