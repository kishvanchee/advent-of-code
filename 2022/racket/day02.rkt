#lang racket
(require racket/match)
(require threading)

(define SAMPLE "../data/day02-sample.txt")
(define ACTUAL "../data/day02.txt")

(define (get-input inp) (file->string inp))

(define (points-shape shape)
  (match shape
    ["X" 1]
    ["Y" 2]
    ["Z" 3]))

(define (game-outcome game)
  (match game
    ["A X" 3]
    ["A Y" 6]
    ["A Z" 0]
    ["B X" 0]
    ["B Y" 3]
    ["B Z" 6]
    ["C X" 6]
    ["C Y" 0]
    ["C Z" 3]))

(define (points-outcome game)
  (+ (points-shape (last (string-split game " "))) (game-outcome game)))

(define (process file)  
  (~> file
      (get-input)
      (string-split "\n")
      (map points-outcome _)
      (apply + _)))

;; part a
(process SAMPLE)
(process ACTUAL)



;; opponent-shape outcome
;; game-outcome + my-shape on outcome

(define (game-outcome-point outcome)
  (match outcome
    ["X" 0]
    ["Y" 3]
    ["Z" 6]))

(define (find-shape game)
  (match game
    ["A X" 3]
    ["A Y" 1]
    ["A Z" 2]
    ["B X" 1]
    ["B Y" 2]
    ["B Z" 3]
    ["C X" 2]
    ["C Y" 3]
    ["C Z" 1]))

(define (points-outcome-b game)
  (+ (game-outcome-point (last (string-split game " "))) (find-shape game)))

(define (process-b file)  
  (~> file
      (get-input)
      (string-split "\n")
      (map points-outcome-b _)
      (apply + _)))

;; part b
(process-b SAMPLE)
(process-b ACTUAL)