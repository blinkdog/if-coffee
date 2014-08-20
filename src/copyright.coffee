###
# copyright.coffee
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

# make sure we have dialog in the appropriate scope
copyrightDialog = null

# when we've finished loading the page
$(document).ready ->
  # when the user clicks on the copyright UI element
  $("#copyright").click ->
    # if the copyright dialog has already been initialized
    if $("#copyright-dialog").length
      # re-open it and move it to the top
      copyrightDialog.dialog "option", "position",
        my: "center",
        at: "center",
        of: window
      copyrightDialog.dialog "open"
      copyrightDialog.dialog "moveToTop"
    else
      # create the copyright dialog object
      COPYRIGHT_DIALOG = """
        <div id="copyright-dialog">
          <p>#{IF.title}<br/>
          Copyright #{new Date().getFullYear()} #{IF.author}</p>

          <p>This program is free software: you can redistribute it and/or modify
          it under the terms of the
          <a href="https://www.gnu.org/licenses/agpl-3.0-standalone.html" target="_blank">
          GNU Affero General Public License</a> as published by the
          <a href="http://www.fsf.org/" target="_blank">Free Software Foundation</a>,
          either version 3 of the License, or (at your option) any later version.</p>
        </div>
      """
      copyrightDialog = $(COPYRIGHT_DIALOG)
      # initialize the copyright dialog object (autoOpen: true, by default)
      copyrightDialog.dialog
        hide:
          effect: "fade"
        resizable: false
        show:
          effect: "fade"
        title: "License"
        width: 588

#----------------------------------------------------------------------------
# end of copyright.coffee
