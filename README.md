# Autolycus :triangular_ruler:

![Swift version](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/License-MIT-lightgray.svg)](https://raw.githubusercontent.com/hkellaway/Autolycus/master/LICENSE)
[![Build Status](https://travis-ci.org/hkellaway/Autolycus.svg?branch=develop)](https://travis-ci.org/hkellaway/Autolycus)

Autolayout DSL for writing layout and constraints programmatically.

## Getting Started

- [Download Autolycus](https://github.com/hkellaway/Autolycus/archive/master.zip) and do a `pod install` on the included `AutolycusDemo` app to see Autolycus in action

### Installation with CocoaPods

```ruby
pod 'Autolycus', :git => 'git@github.com:hkellaway/Autolycus.git', :tag => '0.1.0'
```

### Installation with Carthage

```
github "hkellaway/Autolycus"
```

## Usage

Autolycus is simply syntactic sugar around the verbose programmatic layout API.

### Example

Let's look at a simple example of aligning two views next to each other.

With Autolycus :triangular_ruler::

```
firstView.constrain().size(of: secondView)
firstView.constrain().top(to: secondView)
firstView.constrain().leadingToTrailing(of: secondView)
```

A bit more verbose with `NSLayoutDimension` (iOS 9.0+):

```
firstView.translatesAutoresizingMaskIntoConstraints = false
firstView.widthAnchor.constraint(equalTo: secondView.heightAnchor).isActive = true
firstView.heightAnchor.constraint(equalTo: secondView.heightAnchor).isActive = true
firstView.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
firstView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor).isActive = true
```

Clunkiest of all, with `NSLayoutConstraint`:

```
firstView.translatesAutoresizingMaskIntoConstraints = false
let width = NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: secondView, attribute: .width, multiplier: 1, constant: 0)
let height = NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: secondView, attribute: .height, multiplier: 1, constant: 0)
let leadingToTrailing = NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: secondView, attribute: .trailing, multiplier: 1, constant: 0)
NSLayoutConstraint.activate([width, height, top, leadingToTrailing])
```

The purpose of Autolycus is to simplify constraint creation and obfuscate odd API details.

Autolycus follows the usage passing of calling `constrain()` on the view adopting programmatic layout then chaining together a list of desired constraints, which are automatically applied.

### Convenience functions

Here is a list of convneience functions that Autolycus provides. Each of these produces one or more constraints that are applied to views called upon.

Note that these functions can be called with various parameters to specify placement, such as offeset or insets. 

Constraints are activated by default, but can be made inactive by providing the `isActive` parameter as `false`.

**For single view**

* `width` (e.g. `view.constrain().width(10)`)
* `height`
* `size`

**For relationship between two views**

* `width(to view:)` (e.g. `view.constrain().width(to view: otherView)`)
* `height(to view:)`
* `centerX(to view:)`
* `centerY(to view:)`
* `leading(to view:)`
* `left(to view:)`
* `trailing(to view:)`
* `right(to view:)`
* `top(to view:)`
* `bottom(to view:)`
* `inCenter(of view:)`
* `edges(to view:)`
* `size(of view:)`
* `origin(to view:)`
* `leadingToTrailing(of view:)`
* `leftToRight(of view:)`
* `trailingToLeading(of view:)`
* `rightToLeft(of view:)`
* `topToBottom(of view:)`
* `bottomToTop(of view:)`

**For relationship to superview**

* `widthToSuperview` (e.g. `view.constrain().widthToSuperView()`)
* `heightToSuperview`
* `centerXToSuperview`
* `centerYToSuperview`
* `leadingToSuperview`
* `leftToSuperview`
*`trailingToSuperview`
* `rightToSuperview`
* `topToSuperview`
* `bottomToSuperview`
* `centerInSuperview`
* `edgesToSuperview`
* `sizeOfSuperview`
* `originToSuperview`

### Discussion

There is nothing fancy going on here. Autolycus simply creates `NSLayoutConstraint` instances in a more literate way with reasonable defaults. It also obfuscates the oft-forgotten necessity of setting `translatesAutoresizingMaskIntoConstraints = false` and `isActive = true`.

To that point, our original example could be written more manually with Autolycus just used to generate constraints:

```
firstView.translatesAutoresizingMaskIntoConstraints = false
        
let constraintsArray: [NSLayoutConstraint] = firstView.size(of: secondView, isActive: false)
    + [firstView.top(to: secondView, isActive: false)]
    + [firstView.leadingToTrailing(of: secondView, isActive: false)]
        
NSLayoutConstraint.activate(constraintsArray)
```

Because Autolycus only creates `NSLayoutConstraint` instances, these can be stored for later usage to take advantage of animation or hiding/moving views by way of constraint manipulation.

## Credits

Autolycus was created by [Harlan Kellaway](http://harlankellaway.com).

## License

Autolycus is available under the MIT license. See the [LICENSE](https://raw.githubusercontent.com/hkellaway/Autolycus/master/LICENSE) file for more info.
