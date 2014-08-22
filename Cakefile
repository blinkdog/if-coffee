# Cakefile
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

{exec} = require 'child_process'
{version} = require './package.json'

task 'build', 'Build the project', ->
  compile()

task 'clean', 'Remove build and distribution products', ->
  clean()

task 'develop', 'Work in development mode', ->
  develop()

task 'dist', 'Create distribution tarball', ->
  clean -> compile -> distribute()

task 'read', 'Read/Play the Interactive Fiction', ->
  browse()

task 'rebuild', 'Rebuild the project from scratch', ->
  clean -> compile()

#----------------------------------------------------------

DIST_COMMAND = """
tar cvzf if-coffee/if-coffee-#{version}.tar.gz \
if-coffee/README.md \
if-coffee/LICENSE \
if-coffee/if-coffee.html \
if-coffee/css \
if-coffee/js \
if-coffee/lib
"""

browse = (next) ->
  exec 'firefox --new-window --safe-mode if-coffee.html', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
    next?()

compile = (next) ->
  exec 'node_modules/coffee-script/bin/coffee -o lib/ -c src', (err, stdout, stderr) ->
    throw err if err
    exec 'node_modules/coffee-script/bin/coffee -o lib/ -c ifcomp', (err, stdout, stderr) ->
      throw err if err
      next?()

develop = ->
  exec 'node_modules/coffee-script/bin/coffee --watch -o lib/ -c src', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

distribute = (next) ->
  exec DIST_COMMAND, { cwd: '..' }, (err, stdout, stderr) ->
    throw err if err
    next?()

clean = (next) ->
  exec "rm -f if-coffee-*.tar.gz", (err, stdout, stderr) ->
    throw err if err
    exec "rm -f lib/*", (err, stdout, stderr) ->
      throw err if err
      next?()
          
#----------------------------------------------------------------------------
# end of Cakefile
