(in-package #:euler)
;;
;; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
;;
;;  All numbers are divisible by 1
;;  I can ignore <= 10 because:
;;  / by 12 is / by 2, 3, 4, 6
;;  / by 14 is / by 7
;;  / by 15 is / by 5
;;  / by 16 is / by 8
;;  / by 18 is / by 9
;;  / by 20 is / by 10
;;
(defparameter *divisors* (loop :for i :from 11 :upto 20 :collect i))
;;
(defun dividesp (n d)
  (= 0 (rem n d)))
;;
(time (print
       (loop :for i :from 20 :by 20
             :when (every #'(lambda (n) (dividesp i n)) *divisors*)
               :return i)))
;; 232792560
