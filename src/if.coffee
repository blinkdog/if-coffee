###
# if.coffee
# Copyright 2014 Patrick Meade.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#----------------------------------------------------------------------------
###

# define the interaction fiction library class (IF)
class IF
  constructor: (@_title, @author) ->
  
  Object.defineProperties @prototype,
    title:
      get: -> @_title
      set: (@_title) ->
        $("title")[0].text = @_title
  
  # does the IF library support this browser?
  isSupported: ->
    # the IF library DOES NOT support Microsoft Internet Explorer
    return false if navigator?.appName is 'Microsoft Internet Explorer'
    return false if window?.msRequestAnimationFrame?
    # anybody else is OK
    return true

# define the global interaction fiction library (IF)
window.IF = new IF "Untitled", "The Author"

###
  Friends don't let friends browse with Microsoft Internet Explorer
###
$(document).ready ->
  if not window.IF.isSupported()
    $("body").replaceWith('<body><a href="http://donotuseie.com/" class="frown">☹</a></body>')
    delete window.IF

#----------------------------------------------------------------------------
# end of if.coffee
