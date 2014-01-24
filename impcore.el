;;; impcore.el --- Impcore editing mode

(require 'scheme)

;; define keywords groups
(setq impcore-keywords '("define" "val"))
(setq impcore-functions '())


;; create regex string for keyword groups
(setq impcore-keywords-regexp (regexp-opt impcore-keywords 'words))
(setq impcore-functions-regexp (regexp-opt impcore-functions 'words))

;; clear lists to save memory
(setq impcore-keywords nil)
(setq impcore-functions nil)

;; create  list for font-lock
(setq impcore-font-lock-keywords
      `((,impcore-keywords-regexp  . font-lock-keyword-face)
        (,impcore-functions-regexp . font-lock-function-name-face)))

;;;###autoload
(define-derived-mode impcore-mode scheme-mode "Impcore"
  "Major mode for editing Impcore files"
  (setq font-lock-defaults '((impcore-font-lock-keywords))))

(provide 'impcore-mode)
