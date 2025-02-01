;;; generate-doc.lisp --- generate documentation

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

(quicklisp:quickload "trivial-open-browser")
(quicklisp:quickload "rs-doc") ;private

(in-package :rs-doc-user)

(let ((data (gather-doc
             :title "TRIVIAL-OPEN-BROWSER"
             :package :trivial-open-browser))
      (doc-dir (merge-pathnames
                (make-pathname :directory '(:relative "doc"))
                (asdf:system-source-directory "trivial-open-browser"))))
  (generate-doc
   :data data
   :output-format :html
   :output (merge-pathnames (uiop:parse-unix-namestring "trivial-open-browser.html") doc-dir))
  (generate-doc
   :data data
   :output-format :text
   :output (merge-pathnames (uiop:parse-unix-namestring "trivial-open-browser.txt") doc-dir))
  ())

;;; generate-doc.lisp ends here
