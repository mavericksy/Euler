(in-package #:euler)
;;
;; A pythagorean triplet is a set of three natural numbers, a < b < c, for which a^2 + b^2 = c^2
;; For example, 3^2 + $^2 = 9 + 16 = 25 = 5^2
;; There exists exactly ine pythagorean triplet for which a + b + c = 1000
;; Find the product abc.
;;
(time (print
       (product (first (pythag-triplets-of-perimeter 1000)))))
;;
;; 31875000
