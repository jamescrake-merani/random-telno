;; Random Telephone Number - generates a random Ofcom drama number.
;; Copyright (C) 2022  James Crake-Merani
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(define-module (random-telno common))

(use-modules (ice-9 format))

(define standard-areas
  '("0113" "0114" "0115" "0116" "0117" "0118" "0121" "0131" "0141" "0151" "0161"))

(define all-areas
  '("0113" "0114" "0115" "0116" "0117" "0118" "0121" "0131" "0141" "0151" "0161" "020" "0191" "028" "029" "01632"))

(define areaname-code '(("leeds" . "0113")
                        ("sheffield" . "0114")
                        ("nottingham" . "0115")
                        ("leicester" . "0116")
                        ("bristol" . "0117")
                        ("reading" . "0118")
                        ("birmingham" . "0121")
                        ("edinburgh" . "0131")
                        ("glasgow" . "0141")
                        ("liverpool" . "0151")
                        ("manchester" . "0161")
                        ("london" . "020")
                        ("tyneside" . "0191")
                        ("durham" . "0191")
                        ("sunderland" . "0191")
                        ("northern-ireland" . "028")
                        ("ni" . "028")
                        ("cardiff" . "029")
                        ("none" . "01632")))

(define* (generate-n-phone-numbers n #:optional area-code)
  (letrec ((loop (lambda (n-remaining numbers)
                   (if (<= n-remaining 0)
                     numbers
                     (let ((number-candidate (format-areacode-number area-code)))
                       (if (member number-candidate numbers)
                           (loop n-remaining numbers)
                           (loop (1- n-remaining) (cons number-candidate numbers))))))))
    (loop n '())))
(export generate-n-phone-numbers)

(define* (format-areacode-number #:optional area-code)
  (if area-code
      (if (member area-code standard-areas)
          (format-standard-number)
          (let ((areacode-assoc (assoc area-code areacode-function)))
            (if areacode-assoc
                ((cdr (assoc area-code areacode-function)))
                (throw 'invalid-areacode "Area code is invalid" area-code))))
      (format-areacode-number (list-ref all-areas (random (length all-areas))))))
;; There seems to be no equivalent of define-public for * so this will have to do.
(export format-areacode-number)

(define-public (format-standard-number)
  (format #f "~a4960~3,'0d" (list-ref standard-areas (random (length standard-areas))) (random 999)))

(define-public (format-london-number)
  (format #f "02079460~3,'0d" (random 999)))

(define-public (format-tyneside-number)
  (format #f "01914980~3,'0d" (random 999)))

(define-public (format-ni-number)
  (format #f "02896496~3,'0d" (random 999)))

(define-public (format-cardiff-number)
  (format #f "02920180~3,'0d" (random 999)))

(define-public (format-noarea-number)
  (format #f "01632960~3,'0d" (random 999)))

(define areacode-function (list
                           (cons "020" format-london-number)
                           (cons "0191" format-tyneside-number)
                           (cons "028" format-ni-number)
                           (cons "029" format-cardiff-number)
                           (cons "01632" format-noarea-number)))
