(in-package #:euler)
;;
;;
(defun square (a)
  (* a a))
;;
(defun pythag-triplet-p (a b c)
  (= (+ (square a)
        (square b))
     (square c)))
;;
(defun adjoin% (list item &rest keyword-args)
  (apply #'adjoin item list keyword-args))
;;
(define-modify-macro adjoinf (item &rest keyword-args) adjoin%)
;;
(defun pythag-triplets-of-perimeter (p)
  (loop :for c :from 1 :upto (- p 2)
        :with result = '()
        :do (loop :for a :from 1 :below (min c (- p c))
                  :for b = (- p c a)
                  :when (pythag-triplet-p a b c)
                    :do (adjoinf result
                                 (sort (list a b c) #'<)
                                 :test #'equal))
        :finally (return result)))
;;
(defun product (sequence &key key (initial-value 1) modulo)
  "Return the product of all elements of `sequence`.

  If `key` is given, it will be called on each element to compute the
  multiplicand.

  If `initial-value` is given, it will be used instead of 1 to seed the
  multiplication.

  If `modulo` is given the successive products will be modulo'ed by it along the
  way, which can prevent the need for bignums if you don't need the full result.

  Examples:

    (product #(1 2 3))
    ; => 6

    (product #(1 2 3) :modulo 5)
    ; => 1

    (product #(1 2 3) :modulo 5 :initial-value 2)
    ; => 2

    (product '(\"1\" \"2\" \"3\") :key #'parse-integer)
    ; => 6

    (product '(\"1\" \"2\" \"3\") :key #'length)
    ; => 1

  "
  (let ((result initial-value))
    (when modulo (mod result modulo))
    (if modulo
      (if key
        (doseq (n sequence) (setf result (mod (* result (funcall key n)) modulo)))
        (doseq (n sequence) (setf result (mod (* result n) modulo))))
      (if key
        (doseq (n sequence) (setf result (* result (funcall key n))))
        (doseq (n sequence) (setf result (* result n)))))
    result))
;;
(defun summation (sequence &key key (initial-value 0) modulo)
  "Return the sum of all elements of `sequence`.

  If `key` is given, it will be called on each element to compute the addend.

  If `initial-value` is given, it will be used instead of 0 to seed the addition.

  If `modulo` is given the successive sums will be modulo'ed by it along the
  way, which can prevent the need for bignums if you don't need the full result.

  This function's ugly name was chosen so it wouldn't clash with iterate's `sum`
  symbol.  Sorry.

  Examples:

    (summation #(1 2 3))
    ; => 6

    (summation '(\"1\" \"2\" \"3\") :key #'parse-integer)
    ; => 6

    (summation '(\"1\" \"2\" \"3\") :key #'length)
    ; => 3

  "
  (let ((result initial-value))
    (when modulo (modf result modulo))
    (if modulo
      (if key
        (doseq (n sequence) (setf result (mod (+ result (funcall key n)) modulo)))
        (doseq (n sequence) (setf result (mod (+ result n) modulo))))
      (if key
        (doseq (n sequence) (setf result (+ result (funcall key n))))
        (doseq (n sequence) (setf result (+ result n)))))
    result))
