## GNUmakefile --- make file for the trivial-open-browser library

# Copyright (C) 2025 Ralph Schleicher

# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the “Software”), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom
# the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

## Code:

PACKAGE := trivial-open-browser
VERSION := $(shell head -n1 VERSION)
TARNAME := $(PACKAGE)-$(VERSION)

system_SOURCES := $(PACKAGE).asd \
$(shell grep -E -e ':file +"' $(PACKAGE).asd | \
        sed -E -e 's;.*:file +";;' -e 's;".*;.lisp;')

### Rules

.PHONY: all
all:

.PHONY: check
check: check-build

.PHONY: check-build
check-build: quicklisp-check-build.stamp
quicklisp-check-build.stamp: $(system_SOURCES)
	quicklisp-check-build -sbcl -ccl $(PACKAGE)
	echo timestamp > $@

.PHONY: clean
clean:

### Maintenance

.PHONY: doc
doc:
	sbcl --non-interactive --load generate-doc.lisp

.PHONY: tag
tag: all
	@if test 0 != `git status --short --untracked-files=no | wc -l` ; then \
	    echo "Working copy is not clean" >&2 ; \
	    exit 1 ; \
	fi
	@if test X$(TARNAME) = X`git tag --list $(TARNAME)` ; then \
	    echo "Tag already exists" >&2 ; \
	    exit 1 ; \
	fi
	git tag -a $(TARNAME) -m "Version $(VERSION)."

.PHONY: sync
sync: all
	git push
	git push origin --tags

## GNUmakefile ends here
