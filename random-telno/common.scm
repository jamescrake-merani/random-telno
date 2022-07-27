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
