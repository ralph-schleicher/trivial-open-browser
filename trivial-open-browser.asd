(in-package :asdf-user)

(defsystem trivial-open-browser
  :version "0.1"
  :author "Fernando Borretti"
  :license "MIT"
  :homepage "https://github.com/eudoxia0/trivial-open-browser"
  :depends-on (:uiop :trivial-features)
  :components ((:module "src"
                :components
                ((:file "trivial-open-browser"))))
  :description "Open a file or URL, on any system."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))
