;;; init-40-coding-gen.el --- Code for general programming

;;; Commentary:
;; General tools for programming across languages.  This consists of:
;;   Company :: used for code completion
;;   Projectile :: used for searching projects
;;   Magit :: used for interfacing with git/github
;;   Flycheck :: code syntax/convention checking

;;; Code:

;; Don't use tab characters; use 2 spaces
(setq-default tab-width 2
              indent-tabs-mode nil)

;; === Code Completion ===
(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode)
  (general-define-key
   :keymaps 'company-active-map
   "C-j" 'company-select-next
   "C-k" 'company-select-previous
   "C-l" 'company-complete-selection)

  :defines company-dabbrev-downcase
  :config
  (setq company-idle-delay   nil
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-dabbrev-downcase nil
        )
  )

;; === Tools ===

;; == YASnippet
(use-package yasnippet
  :ensure t
  :defer t
  :config (yas-global-mode t)
  )

;; == ws-butler ==
;; This cleans up any whitespace at the end of lines.
(use-package ws-butler
  :ensure t
  :init
  (ws-butler-global-mode)
  :diminish ws-butler-mode
  )

;; == Projectile ==
(use-package projectile
  :ensure t
  :diminish projectile-mode
  ;; :bind
  ;; (("C-c p f" . helm-projectile-find-file)
  ;;  ("C-c p p" . helm-projectile-switch-project)
  ;;  ("C-c p s" . projectile-save-project-buffers))
  :config
  (general-define-key
   :keymaps 'projectile-map
   "C-c p f" 'helm-projectile-find-file
   "C-c p p" 'helm-projectile-switch-project
   "C-c p s" 'projectile-save-project-buffers
   )
  :config
  (projectile-mode +1)
  )

(use-package helm-projectile
  :ensure t
  :after (:all projectile helm)
  :config
  (helm-projectile-on)
  )

;; == ag ==
;; Note that 'ag' (the silver searcher) needs to be installed.
(use-package ag
  :ensure t
  :defer t
  )

(use-package helm-ag
  :ensure t
  :defer t
  :after (:all helm ag)
  :config
  (general-define-key :keymaps 'helm-ag-map
                      "C-c C-e" 'helm-ag-edit)
  )

;; == magit ==
(use-package magit
  :bind (("C-M-g" . magit-status)))

;; == flycheck ==
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; == other languages ==
(use-package haskell-mode
  :ensure t
  :defer t
  )

;; == miscellaneous ==
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  ;; this is not working?
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  )

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package crux
  :ensure t
  :bind
  ("C-k" . crux-smart-kill-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

(use-package avy
  :ensure t
  :bind
  ("C-=" . avy-goto-char)
  :config
  (setq avy-background t))

(require 'server)
(if (not (server-running-p)) (server-start))


;;; init-40-coding-gen.el ends here
