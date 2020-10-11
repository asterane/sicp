;; Exercise 1.8

(define (cbrt-iter guess change x)
  (if (good-enough? guess change x)
      guess
      (cbrt-iter (improve guess x)
                 (- guess (improve guess x))
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess change x)
  (> (/ guess (abs change)) 1000000))

(define (cbrt x)
  (cbrt-iter 1.0 1.0 x))
