(defpackage :cl-mito-practice/app
  (:use :cl)
  (:import-from :dbi)
  (:import-from :mito)
  (:export :main))
(in-package :cl-mito-practice/app)

(defparameter *app-root* (asdf:system-source-directory :cl-mito-practice))
(defparameter *db-name*  (merge-pathnames #P"db/test.db" *app-root*))

(defclass user ()
  ((name  :col-type (:varchar 64)
          :accessor user-name)
   (email :col-type (or (:varchar 128) :null)
          :accessor user-email))
  (:metaclass mito:dao-table-class))

(defun view-table (obj)
  (format t "Name:~A~%" (user-name obj))
  (format t "Email:~A~%" (user-email obj)))

(defun main ()
  (let ((obj (make-instance 'user
                            :name "foo"
                            :email "foo@foo.com")))
    (view-table obj)))
