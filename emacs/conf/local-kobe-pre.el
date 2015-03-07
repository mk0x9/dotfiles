; for panasonic cf-r4

(setq mk9/font "Ubuntu Mono-11:weight=bold")
(setq mk9/font-jp "Meiryo-10")
(setq mk9/theme 'jazz)

(require 'battery)

(custom-set-variables
 '(battery-echo-area-format "Power %L, battery %B (%p%% load, remaining time %t)")
 '(battery-mode-line-format "[%b%p%%]")
 '(battery-status-function (quote battery-linux-sysfs)))

(defun battery-linux-sysfs ()
  "Get ACPI status information from Linux kernel.
This function works only with the new `/sys/class/power_supply/'
format introduced in Linux version 2.4.25.

The following %-sequences are provided:
%c Current capacity (mAh or mWh)
%r Current rate
%B Battery status (verbose)
%d Temperature (in degrees Celsius)
%p Battery load percentage
%L AC line status (verbose)
%m Remaining time (to charge or discharge) in minutes
%h Remaining time (to charge or discharge) in hours
%t Remaining time (to charge or discharge) in the form `h:min'"
  (let (charging-state rate temperature hours
	(charge-full 0.0)
	(charge-now 0.0)
	(energy-full 0.0)
	(energy-now 0.0))
    ;; SysFS provides information about each battery present in the
    ;; system in a separate subdirectory.  We are going to merge the
    ;; available information together.
    (with-temp-buffer
      (dolist (dir (ignore-errors
		    (directory-files
		     "/sys/class/power_supply/" t
                     "[bB][aA][tT][0-9aA]?$")))
	(erase-buffer)
	(ignore-errors (insert-file-contents
			(expand-file-name "uevent" dir)))
	(when (re-search-forward "POWER_SUPPLY_PRESENT=1$" nil t)
	  (goto-char (point-min))
	  (and (re-search-forward "POWER_SUPPLY_STATUS=\\(.*\\)$" nil t)
	       (member charging-state '("Unknown" "Full" nil))
	       (setq charging-state (match-string 1)))
	  (goto-char (point-min))
	  (when (re-search-forward
                 "POWER_SUPPLY_\\(CURRENT\\|POWER\\)_NOW=\\([0-9]*\\)$"
                 nil t)
	    (setq rate (float (string-to-number (match-string 2)))))
	  (goto-char (point-min))
	  (when (re-search-forward "POWER_SUPPLY_TEMP=\\([0-9]*\\)$" nil t)
	    (setq temperature (match-string 1)))
	  (goto-char (point-min))
	  (let (full-string now-string)
	    ;; Sysfs may list either charge (mAh) or energy (mWh).
	    ;; Keep track of both, and choose which to report later.
	    (cond ((and (re-search-forward
			 "POWER_SUPPLY_CHARGE_FULL=\\([0-9]*\\)$" nil t)
			(setq full-string (match-string 1))
			(re-search-forward
			 "POWER_SUPPLY_CHARGE_NOW=\\([0-9]*\\)$" nil t)
			(setq now-string (match-string 1)))
		   (setq charge-full (+ charge-full
					(string-to-number full-string))
			 charge-now  (+ charge-now
					(string-to-number now-string))))
		  ((and (progn (goto-char (point-min)) t)
			(re-search-forward
			 "POWER_SUPPLY_ENERGY_FULL=\\([0-9]*\\)$" nil t)
			(setq full-string (match-string 1))
			(re-search-forward
			 "POWER_SUPPLY_ENERGY_NOW=\\([0-9]*\\)$" nil t)
			(setq now-string (match-string 1)))
		   (setq energy-full (+ energy-full
					(string-to-number full-string))
			 energy-now  (+ energy-now
					(string-to-number now-string))))))
	  (goto-char (point-min))
	  (when (and energy-now rate (not (zerop rate))
		     (re-search-forward
                      "POWER_SUPPLY_VOLTAGE_NOW=\\([0-9]*\\)$" nil t))
	    (let ((remaining (if (string= charging-state "Discharging")
				 energy-now
			       (- energy-full energy-now))))
	      (setq hours (/ (/ (* remaining (string-to-number
                                              (match-string 1)))
                                rate)
			     10000000.0)))))))
    (list (cons ?c (cond ((or (> charge-full 0) (> charge-now 0))
			  (number-to-string charge-now))
			 ((or (> energy-full 0) (> energy-now 0))
			  (number-to-string energy-now))
			 (t "N/A")))
	  (cons ?r (if rate (format "%.1f" (/ rate 1000000.0)) "N/A"))
	  (cons ?m (if hours (format "%d" (* hours 60)) "N/A"))
	  (cons ?h (if hours (format "%d" hours) "N/A"))
	  (cons ?t (if hours
		       (format "%d:%02d" hours (* (- hours (floor hours)) 60))
		     "N/A"))
	  (cons ?d (or temperature "N/A"))
	  (cons ?B (or charging-state "N/A"))
	  (cons ?p (cond ((and (> charge-full 0) (> charge-now 0))
			  (format "%.1f"
				  (/ (* 100 charge-now) charge-full)))
			 ((> energy-full 0)
			  (format "%.1f"
				  (/ (* 100 energy-now) energy-full)))
			 (t "N/A")))
	  (cons ?L (if (file-readable-p "/sys/class/power_supply/AC/online")
		       (if (battery-search-for-one-match-in-files
			    (list "/sys/class/power_supply/AC/online"
				  "/sys/class/power_supply/ACAD/online")
			    "1" 0)
			   "AC"
			 "BAT")
		     "N/A")))))

;(display-battery-mode 1)
