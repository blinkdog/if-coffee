# if-coffee
Interactive Fiction in CoffeeScript

## Motivation
Interactive Fiction is fun! Is more motivation required? :-)

## Dependencies
if-coffee depends on [jQuery 2.1.1](http://code.jquery.com/jquery-2.1.1.min.js)

IF will probably work with older versions of jQuery, but this is the only
version the author has tested IF with.

## IF - The Interactive Fiction Library
The included Cakefile will compile src/if.coffee to lib/if.coffee.
Use a <script> tag to include lib/if.coffee in your project, to
make use of the Interactive Fiction library.

### window.IF
The top level object, representing an instance of Interactive Fiction.

#### IF.title( string )
Set the title of the Interactive Fiction. Also updates the <title> tag
in the DOM, thereby setting the title in the browser.

    IF.title 'Attack of the IF Authors from Outer Space'

## License
if-coffee
Copyright 2014 Patrick Meade

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
