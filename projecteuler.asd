;;
;;
(defclass auto-module (asdf:module) ())

(defmethod component-children ((self auto-module))
  (mapcar (lambda (p) (make-instance 'cl-source-file :type "lisp"
                        :pathname p
                        :name (pathname-name p)
                        :parent (asdf:component-parent self)))
          (asdf::directory-files (asdf:component-pathname self)
                           (make-pathname :directory nil :name :wild :type "lisp"))))
;;
(asdf:defsystem #:euler
  :depends-on (:losh
               :iterate)
  :components ((:file "package")
               (:module "src"
                :serial t
                :components ((:file "utils")
                             (:file "primes")
                             (:auto-module "euler")))))
