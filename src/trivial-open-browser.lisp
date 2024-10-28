(in-package :cl-user)

(defpackage trivial-open-browser
  (:use :cl)
  (:export #:*browser-program*
           #:*browser-function*
           #:open-browser-through-shell
           #:open-browser))

(in-package :trivial-open-browser)

(defvar *browser-program* (progn
                            #+windows
                            "start"
                            #+darwin
                            "open"
                            #-(or windows darwin)
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
