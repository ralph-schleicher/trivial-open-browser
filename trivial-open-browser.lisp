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
  (:export #:open-browser-through-shell
           #:*browser-function*
           #:open-browser))

(in-package :trivial-open-browser)

(defparameter +format-string+
  #+(or win32 mswindows windows)
  "explorer ~S"
  #+(or macos darwin)
  "open ~S"
  #-(or win32 mswindows macos darwin windows)
  "xdg-open ~S")

(defun open-browser-through-shell (url)
  "Run a shell command to open `url`."
  (uiop:run-program (format nil +format-string+ url)))

(defparameter *browser-function* #'open-browser-through-shell
  "The function that gets called with the URL to open the browser. Defaults to
  `browser-function`.")

(defun open-browser (url)
  "Open the browser to `url`."
  (funcall *browser-function* url))

;;; trivial-open-browser.lisp ends here
