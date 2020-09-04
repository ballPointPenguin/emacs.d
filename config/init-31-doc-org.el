;;; init-30-doc-org.el --- Code for initializing org-mode

;;; Commentary:
;; Runs org-mode along with some custom configuration

;;; Code:

(use-package org
  :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
         ("\C-c c" . org-capture))
  :config

  ;; Expansion for blocks "<s" -> "#+BEGIN_SRC"
  (require 'org-tempo)

  (defun sk/diminish-org-indent ()
    "Diminish org-indent-mode on the modeline"
    (interactive)
    (diminish 'org-indent-mode ""))
  (add-hook 'org-indent-mode-hook #'sk/diminish-org-indent)

  ;; == Agenda ==
  (defvar org-agenda-window-setup)
  (setq org-agenda-window-setup 'current-window)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (shell . t)
     ))

  ;; syntax highlight in #+begin_src blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)

  (setq org-highlight-latex-and-related '(latex))

  (use-package helm-org-rifle
    :ensure t)

  (use-package org-ref
    :ensure t
    :after org
    :init
    (setq reftex-default-bibliography '("~/org/resources/bibliography/references.bib"))
    ;; see org-ref for use of these variables
    (setq org-ref-default-bibliography '("~/org/resources/bibliography/references.bib"))
    (setq org-ref-default-citation-link "citep")
    )

  (defun org-build-agenda ()
    (interactive)
    (setq last-build-time (format-time-string "%S.%3N"))
    (org-agenda 0 " ")
    (setq after-build-time (format-time-string "%S.%3N"))
    (print last-build-time)
    (print after-build-time)
    )
  )

  ;; init-31-doc-org.el ends here
