#lang racket
(require rackunit)

(define SAMPLE "../data/day01-sample.txt")
(define ACTUAL "../data/day01.txt")
(define (split-at-newline str) (string-split str "\n"))
(define (get-input inp) (file->string inp))
(define (split-elves elvs) (string-split elvs "\n\n"))
(define (lst-to-num lst) (map (lambda (x) (string->number x)) lst))
(test-equal? "eq" (lst-to-num '("1" "2" "3")) '(1 2 3))
(define (sum elemList) (apply + elemList))
(test-equal? "summation" (sum '(1 2 3)) 6)

(define ip (get-input SAMPLE))
(define each-elf (split-elves ip))
(define clean-elves (map (lambda (x) (split-at-newline x)) each-elf))
(define cl-elves (map (lambda (x) (lst-to-num x)) clean-elves))
(define cals-each-elf (map sum cl-elves))

(define (process input-file)
  (map (lambda (x) (lst-to-num x))
       (map (lambda (x) (split-at-newline x))
            (split-elves (get-input input-file)))))

(apply max (map sum (process SAMPLE)))
(sum (take (sort (map sum (process SAMPLE)) >) 3))
(apply max (map sum (process ACTUAL)))
(sum (take (sort (map sum (process ACTUAL)) >) 3))
