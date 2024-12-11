(in-package #:euler)
;;
;; The sum of the squares of the first ten natural numbers is,
;; 1^2 + 2^2 + ... + 10^2 = 385
;;
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)^2 = 55^2 = 3025
;;
;; Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is
;; 3025 - 385 = 2640
;;
;; Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
;;
(defparameter sq 0)
(defparameter qs 0)
(progn
  (setf sq 0
        qs 0)
  (time (print
         (loop :for i :from 1 :upto 100
               :do (progn
                     (setf sq (+ sq (* i i))
                           qs (+ qs i)))
               :finally (return (if (>= (* qs qs) sq) ; Is this actually possible?
                                        ; Is there a series where the square of the sum
                                        ; could be lower than the sum of the squares?
                                    (- (* qs qs) sq)
                                    (- sq (* qs qs))))))))
;; 25164150
