#lang racket

(define (mingle p q)
  (let iter ([accu empty] [p (string->list p)] [q (string->list q)])
    (if (empty? p)
        (list->string (reverse accu))
        (iter (cons (first q) (cons (first p) accu)) (rest p) (rest q)))))

(define p (read-line))
(define q (read-line))

(displayln (mingle p q))
