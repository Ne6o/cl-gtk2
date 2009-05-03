(defpackage :gtk
  (:use :cl :cffi :gobject :gdk :glib :metabang-bind :anaphora)
  (:export #:register-object-type
           #:gtk-main
           #:gtk-main-quit
           #:dialog-run
           #:object-destroy
           #:text-buffer-insert
           #:define-child-property
           #:container-class-child-properties
           #:generate-child-properties))

(defpackage :gtk-examples
  (:use :cl :gtk :gdk :gobject)
  (:export #:test-dialog))

(in-package :gtk)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-foreign-library gtk
    (:unix (:or "libgtk-x11-2.0.so.0" "libgtk-x11-2.0.so"))
    (t "libgtk-2.0")))

(use-foreign-library gtk)

#+sbcl (when (and (find-package "SB-EXT")
                  (find-symbol "SET-FLOATING-POINT-MODES" (find-package "SB-EXT")))
         (funcall (find-symbol "SET-FLOATING-POINT-MODES" (find-package "SB-EXT")) :traps nil))