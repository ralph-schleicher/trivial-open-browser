# trivial-open-browser

Open a file or URL, on any system.


## Usage

```
(trivial-open-browser:open-browser "https://common-lisp.net/")
```

By default, the library runs a shell command to open the browser on
Windows, OS X, and Linux.  You can customize this by setting the value
of the `*browser-function*` special variable to a function that takes
a URL as its argument and somehow opens the browser to that URL.  The
low-level shell command can be customized by setting the value of the
`*browser-program*` special variable.

The principle applies to plain file names, too.  If the argument to
the `open-browser` function is a file name, the file should be opened
in the associated application.  For example,

```
(trivial-open-browser:open-browser
 (namestring (merge-pathnames
              (uiop:parse-unix-namestring "bar/foo.txt")
              (user-homedir-pathname))))
```


## License

Copyright (C) 2014, 2015, 2016 Fernando Borretti<br>
Copyright (C) 2025 Ralph Schleicher

Licensed under the MIT License.
