(in-package #:euler)
;;
;; The prime factors of 13195 are 5, 7, 13, 29
;;
;; What is the largest prime factor of the number 600851475143
;;
;;six hundred billion eight hundred fifty-one million
;;four hundred seventy-five thousand one hundred forty-three
(defparameter bn 600851475143)
;; (format t "~R" bn)
;;
(defmacro += (a b)
  `(setf ,a (+ ,a ,b)))
;;
(defun factors (n)
  (let ((r))
    (do ((x n) (c 0) (i 2 (+ i 1)))
        ((= x 1) r)
      (setf c 0)
      (when (equal (rem x i) 0)
        (do () ((> (rem x i) 0))
          (+= c 1)
          (setf x (floor (/ x i)))))
      (when (> c 0)
        (and (setf r (cons c r))
             (setf r (cons i r)))))))

(time (print (factors bn)))
;;
;; 71 839 1471 6857
