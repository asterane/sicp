;; Exercise to learn about the Y combinator
;; Help from https://mvanier.livejournal.com/2897.html


;; Definition

(define almost-factorial
  (lambda (f)
    (lambda (n)
      (if (= n 0)
          1
          (* n (f (- n 1)))))))

(define Y
  (lambda (f)
    ((lambda (x) (x x))
     (lambda (x) (f (lambda (y) ((x x) y)))))))

(define factorial (Y almost-factorial))


;; Execution

(factorial 5)

((Y almost-factorial) 5)

(((lambda (x) (x x))
  (lambda (x) (almost-factorial (lambda (y) ((x x) y))))) 5)

((lambda (x) (x x))
 (lambda (x)
   (lambda (n)
     (if (= n 0) 1
         (* n ((lambda (y) ((x x) y)) (- n 1)))))) 5)

((lambda (x)
   (lambda (n)
     (if (= n 0) 1
         (* n ((lambda (y) ((x x) y)) (- n 1))))))
 (lambda (x)
   (lambda (n)
     (if (= n 0) 1
         (* n ((lambda (y) ((x x) y)) (- n 1)))))) 5)

((lambda (n)
   (if (= n 0) 1
       (* n ((lambda (y)
               (((lambda (x)
                   (lambda (n) (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1))))))
                 (lambda (x)
                   (lambda (n) (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                y)) (- n 1))))) 5)

(if (= 5 0) 1
    (* 5 ((lambda (y)
            (((lambda (x)
                (lambda (n) (if (= n 0) 1
                                (* n ((lambda (y) ((x x) y)) (- n 1))))))
              (lambda (x)
                (lambda (n) (if (= n 0) 1
                                (* n ((lambda (y) ((x x) y)) (- n 1)))))))
             y)) (- 5 1))))

(* 5 ((lambda (y)
        (((lambda (x)
            (lambda (n) (if (= n 0) 1
                            (* n ((lambda (y) ((x x) y)) (- n 1))))))
          (lambda (x)
            (lambda (n) (if (= n 0) 1
                            (* n ((lambda (y) ((x x) y)) (- n 1)))))))
         y)) 4))

(* 5 (((lambda (x)
         (lambda (n) (if (= n 0) 1
                         (* n ((lambda (y) ((x x) y)) (- n 1))))))
       (lambda (x)
         (lambda (n) (if (= n 0) 1
                         (* n ((lambda (y) ((x x) y)) (- n 1))))))) 4))

(* 5 ((lambda (n)
        (if (= n 0) 1
            (* n ((lambda (y) (((lambda (x)
                                  (lambda (n)
                                    (if (= n 0) 1
                                        (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                (lambda (x)
                                  (lambda (n)
                                    (if (= n 0) 1
                                        (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                               y)) (- n 1))))) 4))

(* 5 (if (= 4 0) 1
         (* 4 ((lambda (y) ((
                             (lambda (x)
                               (lambda (n)
                                 (if (= n 0) 1
                                     (* n ((lambda (y) ((x x) y)) (- n 1))))))
                             (lambda (x)
                               (lambda (n)
                                 (if (= n 0) 1
                                     (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                            y)) (- 4 1)))))

(* 5 (* 4 ((lambda (y)
             (((lambda (x)
                 (lambda (n)
                   (if (= n 0) 1
                       (* n ((lambda (y) ((x x) y)) (- n 1))))))
               (lambda (x)
                 (lambda (n)
                   (if (= n 0) 1
                       (* n ((lambda (y) ((x x) y)) (- n 1)))))))
              y)) 3)))

(* 5 (* 4 (((lambda (x)
              (lambda (n)
                (if (= n 0) 1
                    (* n ((lambda (y) ((x x) y)) (- n 1))))))
            (lambda (x)
              (lambda (n)
                (if (= n 0) 1
                    (* n ((lambda (y) ((x x) y)) (- n 1))))))) 3)))

(* 5 (* 4 ((lambda (n)
             (if (= n 0) 1
                 (* n ((lambda (y)
                         (((lambda (x)
                             (lambda (n)
                               (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1))))))
                           (lambda (x)
                             (lambda (n)
                               (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                          y)) (- n 1))))) 3)))

(* 5 (* 4 (if (= 3 0) 1
              (* 3 ((lambda (y)
                      (((lambda (x)
                          (lambda (n)
                            (if (= n 0) 1
                                (* n ((lambda (y) ((x x) y)) (- n 1))))))
                        (lambda (x)
                          (lambda (n)
                            (if (= n 0) 1
                                (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                       y)) (- 3 1))))))

(* 5 (* 4 (* 3 ((lambda (y)
                  (((lambda (x)
                      (lambda (n)
                        (if (= n 0) 1
                            (* n ((lambda (y) ((x x) y)) (- n 1))))))
                    (lambda (x)
                      (lambda (n)
                        (if (= n 0) 1
                            (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                   y)) 2))))

(* 5 (* 4 (* 3 (((lambda (x)
                   (lambda (n)
                     (if (= n 0) 1
                         (* n ((lambda (y) ((x x) y)) (- n 1))))))
                 (lambda (x)
                   (lambda (n)
                     (if (= n 0) 1
                         (* n ((lambda (y) ((x x) y)) (- n 1))))))) 2))))

(* 5 (* 4 (* 3 ((lambda (n)
                  (if (= n 0) 1
                      (* n ((lambda (y)
                              (((lambda (x)
                                  (lambda (n)
                                    (if (= n 0) 1
                                        (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                (lambda (x)
                                  (lambda (n)
                                    (if (= n 0) 1
                                        (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                               y)) (- n 1)))))) 2)))

(* 5 (* 4 (* 3 (if (= 2 0) 1
                   (* 2 ((lambda (y)
                           (((lambda (x)
                               (lambda (n)
                                 (if (= n 0) 1
                                     (* n ((lambda (y) ((x x) y)) (- n 1))))))
                             (lambda (x)
                               (lambda (n)
                                 (if (= n 0) 1
                                     (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                            y)) (- 2 1)))))))

(* 5 (* 4 (* 3 (* 2 ((lambda (y)
                       (((lambda (x)
                           (lambda (n)
                             (if (= n 0) 1
                                 (* n ((lambda (y) ((x x) y)) (- n 1))))))
                         (lambda (x)
                           (lambda (n)
                             (if (= n 0) 1
                                 (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                        y)) 1)))))

(* 5 (* 4 (* 3 (* 2 (((lambda (x)
                        (lambda (n)
                          (if (= n 0) 1
                              (* n ((lambda (y) ((x x) y)) (- n 1))))))
                      (lambda (x)
                        (lambda (n)
                          (if (= n 0) 1
                              (* n ((lambda (y) ((x x) y)) (- n 1))))))) 1)))))

(* 5 (* 4 (* 3 (* 2 ((lambda (n)
                       (if (= n 0) 1
                           (* n ((lambda (y)
                                   (((lambda (x)
                                       (lambda (n)
                                         (if (= n 0) 1
                                             (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                     (lambda (x)
                                       (lambda (n)
                                         (if (= n 0) 1
                                             (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                     y)) (- n 1)))))) 1)))))

(* 5 (* 4 (* 3 (* 2 (if (= 1 0) 1
                        (* 1 ((lambda (y)
                                (((lambda (x)
                                    (lambda (n)
                                      (if (= n 0) 1
                                          (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                  (lambda (x)
                                    (lambda (n)
                                      (if (= n 0) 1
                                          (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                                 y)) 0)))))))

(* 5 (* 4 (* 3 (* 2 (* 1 ((lambda (y)
                            (((lambda (x)
                                (lambda (n)
                                  (if (= n 0) 1
                                      (* n ((lambda (y) ((x x) y)) (- n 1))))))
                              (lambda (x)
                                (lambda (n)
                                  (if (= n 0) 1
                                      (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                             y)) 0))))))

(* 5 (* 4 (* 3 (* 2 (* 1 (((lambda (x)
                             (lambda (n)
                               (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1))))))
                           (lambda (x)
                             (lambda (n)
                               (if (= n 0) 1
                                   (* n ((lambda (y) ((x x) y)) (- n 1))))))) 0))))))

(* 5 (* 4 (* 3 (* 2 (* 1 ((lambda (n)
                            (if (= n 0) 1
                                (* n ((lambda (y)
                                        (((lambda (x)
                                            (lambda (n)
                                              (if (= n 0) 1
                                                  (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                          (lambda (x)
                                            (lambda (n)
                                              (if (= n 0) 1
                                                  (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                                         y)) (- n 1))))) 0))))))

(* 5 (* 4 (* 3 (* 2 (* 1 (if (= 0 0) 1
                             (* n ((lambda (y)
                                     (((lambda (x)
                                         (lambda (n)
                                           (if (= n 0) 1
                                               (* n ((lambda (y) ((x x) y)) (- n 1))))))
                                       (lambda (x)
                                         (lambda (n)
                                           (if (= n 0) 1
                                               (* n ((lambda (y) ((x x) y)) (- n 1)))))))
                                      y)) (- n 1)))))))))

(* 5 (* 4 (* 3 (* 2 (* 1 1)))))

(* 5 (* 4 (* 3 (* 2 1))))

(* 5 (* 4 (* 3 2)))

(* 5 (* 4 6))

(* 5 24)

120

;; Recursion!
