nowrap
======

Takes input on stdin and copies it to stdout, truncating to the width of the
terminal as needed. This is very similar to <code>cut -c1-${COLUMNS}</code>
except that this script attempts to understand a limited set of terminal escape
sequences so that colorized output isn't prematurely truncated.

Example
=======
Cut the output of git log at window width

    nline=$(expr $(tput lines) - 1)
    git --no-pager log | nowrap | head -n $nline

*Author*: Dave Goodell <davidjgoodell@gmail.com>

-----------------------------------------------------------------------
Copyright (c) 2009 Dave Goodell

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
