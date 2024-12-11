(in-package #:euler)
;;
;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17
;; Find the sum of all the primes below 2 million
;;
(time (print
       (summation (sieve 2000000))))
;;
;; 142913828922
