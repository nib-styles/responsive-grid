# responsive-grid


We use a responsive grid component to build all of the layouts on the site. This grid is used entirely with classes in the markup. This means we can keep the layout of pages separate from from the other modules.

## Installation

```
component install nib-styles/responsive-grid
```

## Development

To build the CSS file used in the component

```
component install --dev && make build
```

## Usage

The grid is made up of these parts:

* Grid classes
* Size classes
* Visibility classes
* Spacing classes

With these it is possible to create layouts for any device without needing to write any new CSS. This means the CSS will scale regardless of how many new pages are added.

### The Grid

The grid itself consists of 12 columns with a max width of 960px. The grid has no gutters and the columns sit flush against each other. The reason for this is that we can use fixed percentages for the widths of columns, for example, with 2 columns, each column is 50%. Using percentages this way means the grid is responsive. The width of the grid can change, but those two columns will always be 2 columns.

This is possible because of the `box-sizing:border-box` property. This allows us to then add padding and border to the columns without making the columns wider. 

### Class Prefixes

Every class in this package is prefixed with `rg-`. This is just a namespace for the classes so they are easily identifable.

### Breakpoints

The grid has 5 breakpoints.

* up to 320px (4 columns)
* 480px (6 columns)
* 640px (8 columns)
* 800px (10 columns)
* 960px (12 columns)

These aren't based on devices, they all fall on columns on the grid. The breakpoints are all set in em units so they are relative to the font size.

As the window size decreases there are few columns available. This means that at 960px and above, we're using a 12 column grid, at 800px we're using a 10 column grid and so forth.

### Size Classes

The main layout classes are based on the grid columns:

```html
<div class="rg-1of12"></div>
```

This will make the div 1 column wide when there are 12 columns available. If we change this:

```html
<div class="rg-2of10"></div>
```

This will no be 2 columns wide when there are 10 columns available. This is between 800px and 960px. 

These classes are available for each breakpoint, for example:

```
.rg-1of4
.rg-1of6
.rg-1of8
.rg-1of10
.rg-1of12
etc...
```

### Mobile First

The sizing classes are all mobile-first. What this means is that if you apply a class of `.rg-2of4` (50%) this will work at every breakpoint above it, so you **don't need to do this**:

```html
<div class="rg-1of4 rg-3of6 rg-4of8 rg-5of10 rg-6of12"></div>
```

Instead, you can do this:

```html
<div class="rg-1of4 rg-3of6"></div>
```

And this will be carried up to each higher breakpoint. It will be 1 column at 4 columns wide (320px) and 2 columns wide at 6 columns and higher.

### Grid Units

You obviously need more than just widths. You want these columns to sit next to each other. For this you need to setup a few classes:

```html
<div class="rg-Grid">
  <div class="rg-Unit rg-3of6"></div>
  <div class="rg-Unit rg-3of6"></div>
</div>
```

The `rg-Unit` class makes the element inline-block and the `rg-Grid` class makes them sit flush next to each other. Think of `rg-Grid` as a row of columns. We structure it like this so that nesting of grids is possible. This allows an infinite number of layouts.

### Page Class

Most of the time you don't want the grid sitting on the left of the screen. For this you want to center everything in the middle of the page and set the max width of the grid. 

```html
<div class="rg-Page"> <!-- Centers the grid -->
  <div class="rg-Grid"> <!-- Aligns the grid units -->
    <div class="rg-Unit rg-3of6"></div> <!-- A grid unit  -->
    <div class="rg-Unit rg-3of6"></div>
  </div>
</div>
```

### Visibility Classes

**Showing and hiding elements at breakpoints**

With responsive design there are often times when you want to show and hide elements at different breakpoints. There are visibility classes for this:

```html
<div class="rg-Grid">
  <div class="rg-Unit rg-3of6 rg-invisibleAt4 rg-visibleAt12">
    Only shown at 12 columns or higher
  </div>
  <div class="rg-Unit rg-3of6 rg-invisibleAt12">
    Only shown below 12 columns
  </div>
</div>
```

There are two types of classes `rg-invisibleAtX` and `rg-visibleAtX`.

### Spacing Classes

One of the key parts of writing maintainable CSS is separating the layout from the decoration. Having spacing classes in our html as part of the layout means that our other CSS modules don't need to include padding or margin, making them even more flexible.

The spacing classes are used to add padding and margin at different breakpoints. Just like the size classes they are mobile first.

```html
<div class="rg-mx3at4"></div>
<div class="rg-pt4at4"></div>
```

There are two types of spacing classes - margin and padding. Then spacing can be applied on all sides, top, left, bottom, right, horizontally (left and right) and vertically (top and bottom). 

They can then be multiple sizes: `0px, 5px, 10px, 20px, 40px, 60px`.

Finally, they can be applied at specific breakpoints.

Using these factors we can build up the classes we need. For example, if we want 20px padding on the top only at 12 columns wide:

```
rg-pt4at12
```

Lets break it down:

* `pt` - Padding top
* `4` - 4th largest size (20px)
* `at12` - Only at 12 columns

Here are some examples of the various sizes you can choose:

* `p` - This will apply padding on all sides
* `pt` - Padding on the top
* `pr` - Padding on the right
* `pb` - Padding on the bottom
* `pl` - Padding on the left
* `px` - Padding on the left and right
* `py` - Padding on the top and bottom

You can replace the `p` in all these examples to use margin instead of padding.

### Mobile First

As with the sizing classes, these are mobile first, so you don't need to apply spacing at every breakpoint, just at the lowest point. 

For example, if you wanted 20px padding on all sides at every breakpoint, just apply it at 4 columns: `rg-p4at4`. This will affect every breakpoint above it.
