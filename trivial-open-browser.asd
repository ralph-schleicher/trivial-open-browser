;;; trivial-open-browser.asd --- ASDF system definitions

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

(in-package :asdf-user)

(defsystem "trivial-open-browser"
  :description "Open the browser to a URL, on any system."
  :author "Fernando Borretti"
  :maintainer "Ralph Schleicher <rs@ralph-schleicher.de>"
  :homepage "https://github.com/ralph-schleicher/trivial-open-browser"
  :license "MIT"
  :version (:read-file-line "VERSION")
  :depends-on ("trivial-features" "uiop")
  :components ((:file "trivial-open-browser")))

;;; trivial-open-browser.asd ends here
