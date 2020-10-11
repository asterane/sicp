;; 1.1.7 Example: Square Roots by Newton's Method
;; Replaced commented lines with my own work for exercise 1.7

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))

(define (sqrt-iter guess change x)
  (if (good-enough? guess change x)
      guess
      (sqrt-iter (improve guess x)
                 (- guess (improve guess x))
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess change x)
  (> (/ guess (abs change)) 1000000))

(define (sqrt x)
  (sqrt-iter 1.0 1.0 x))
