;;; trivial-open-browser.lisp --- open a file or URL

;; Copyright (C) 2014, 2015, 2016 Fernando Borretti
;; Copyright (C) 2025 Ralph Schleicher

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the “Software”), to deal in the Software without
;; restriction, including without limitation the rights to use,
;; copy, modify, merge, publish, distribute, sublicense, and/or
;; sell copies of the Software, and to permit persons to whom
;; the Software is furnished to do so, subject to the following
;; conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
;; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
;; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;; OTHER DEALINGS IN THE SOFTWARE.

;;; Code:

(in-package :common-lisp-user)

(defpackage trivial-open-browser
  (:use :common-lisp)
  (:export #:*browser-program*
           #:*browser-function*
           #:open-browser-through-shell
           #:open-browser))

(in-package :trivial-open-browser)

(defvar *browser-program* (progn
                            #+(or win32 mswindows windows)
                            "start"
                            #+(or macos darwin)
                            "open"
                            #-(or win32 mswindows macos darwin windows)
                            "xdg-open")
  "The shell command to open a file or URL.

Value has to be a string or ‘nil’.  Default is ‘start’ for Windows,
‘open’ for Darwin/macOS, and ‘xdg-open’ otherwise.")
(declaim (type (or simple-string null) *browser-program*))

(defun open-browser-through-shell (location)
  "Run a shell command to open a file or URL.

Argument LOCATION can be a file name or URL (a string).  If
 LOCATION is a file name containing spaces, it must not be
 quoted.

Return value is the exit code of the shell command, or ‘nil’
if ‘*browser-program*’ is ‘nil’.  Please note that there is
no guarantee that the file or URL is actually opened when
the exit code indicates success.

Affected by the ‘*browser-program*’ special variable."
  (check-type location string)
  (when (stringp *browser-program*)
    ;; Pass command as a list so that UIOP can quote
    ;; the arguments properly.
    (nth-value 2 (uiop:run-program (list *browser-program* location)
                                   :ignore-error-status t
                                   :force-shell t))))

(defvar *browser-function* #'open-browser-through-shell
  "The function that gets called with the file name or URL as argument.
Default is the ‘open-browser-through-shell’ function, which see.")
(declaim (type (function (t) t) *browser-function*))

(defun open-browser (location)
  "Open a file or URL.

Argument LOCATION can be a file name or URL (a string).  If
 LOCATION is a file name containing spaces, it must not be
 quoted.

Affected by the ‘*browser-function*’ special variable."
  (funcall *browser-function* location))

;;; trivial-open-browser.lisp ends here
