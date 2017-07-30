#lang racket

(define (sierpinsky s y x)
  (let ([m (- (arithmetic-shift 1 s) 1)])
    (and (m . > . (+ (bitwise-and m (- x y)) (bitwise-and m (* y 2))))
         (= 0 (arithmetic-shift (bitwise-and (- x y) (* y 2)) (- s))))))

(define n (read))

(for ([y (in-range 31 -1 -1)])
     (for ([x 63])
          (display (if (sierpinsky (- 6 n) y x) "1" "_")))
     (newline))
