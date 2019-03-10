(defpackage :cl-mito-practice/app
  (:use :cl
        :mito))
(in-package :cl-mito-practice/app)

(defparameter *app-root* (asdf:system-source-directory :cl-mito-practice))
(defparameter *db-name*  (merge-pathnames #P"db/test.db" *app-root*))

(connect-toplevel :sqlite3 :database-name *db-name*)

(deftable user ()
  ((name  :col-type (:varchar 64))
   (email :col-type (or (:varchar 128) :null))))

(table-definition 'user)

(deftable tweet ()
  ((status :col-type :text)
   (user   :col-type user)))

(table-definition 'tweet)
