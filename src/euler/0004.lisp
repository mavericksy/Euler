(in-package #:euler)
;;
;; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is
;; 9009 = 91 x 99.
;;
;; Find the largest palindrome made from the product of two 3-digit numbers.
;;
(defparameter result 0)
;;
(defun palindromep (n &optional (radix 10))
  "Return whether `n` is a palindrome in base `radix`."
  (let ((s (format nil "~VR" radix n)))
    (string= s (reverse s))))
;;
(time (print
       (loop :for i :from 999 :downto 100
             :do (loop :for j :from 999 :downto 100
                       :for product = (* i j)
                       :do (when (and (palindromep product)
                                      (>= product result))
                             (setf result product)))
             :finally (return result))))
;; 906609
