(defpackage :cl-mito-practice/app
  (:use :cl
        :mito)
  (:export :main))
(in-package :cl-mito-practice/app)

(defparameter *app-root* (asdf:system-source-directory :cl-mito-practice))
(defparameter *db-name*  (merge-pathnames #P"db/test.db" *app-root*))

(defclass user ()
  ((name :col-type (:varchar 64)
         :accessor user-name)
   (email :col-type (or (:varchar 128) :null)
          :accessor user-email))
  (:metaclass dao-table-class))

(defun main ()
  (let ((my-obj (make-instance 'user
                               :name "foo"
                               :email "foo@foo.com")))
    (format t "Name:~A~%"  (user-name my-obj))
    (format t "EMail:~A~%" (user-email my-obj))))
