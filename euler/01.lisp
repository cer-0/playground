;;; If we list all the natural numbers below 10 that are muliples of 3 or 5,
;;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun multiplo-de-5-o-3p (n)
  (cond
      ((or (equal (mod n 5) 0)
           (equal (mod n 3) 0)) t)))

(defun suma-multiplos-antes-de (n)
  (let ((total 0))
    (dotimes (i n total)
      (if (multiplo-de-5-o-3p i) (setf total (+ total i))))))
