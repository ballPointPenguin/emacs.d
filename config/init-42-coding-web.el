;;; init-42-coding-web.el --- Coding for web development

;;; Commentary:
;; Tools for programming web apps.This consists of:
;;   web-mode :: excellent syntax highlighting/indentation for html, css etc
;;   emmet :: code expansion for html/css

;;; Code:

;; == web-mode ==
(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode))

  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq indent-tabs-mode nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-current-element-highlight t)
    )
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  )

;; == emmet ==
(use-package emmet-mode
  :ensure t
  :defer t
  :diminish emmet-mode
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  )

;; == indium ==
;; (use-package indium
;;   :ensure t
;;   :config
;;   (eval-when-compile
;;     (add-hook 'js-mode-hook #'indium-interaction-mode)))

;; == js2-refactor ==
(use-package js2-refactor
  :ensure t
  :defer t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (add-hook 'js-mode #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

;; == JSON ==
(use-package json-mode
  :ensure t
  :defer t
  :config
  (setq js-indent-level 2))

;; == TypeScript ==
(use-package typescript-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist
               '("\\.ts\\'" . typescript-mode)))

;; == Vue ==
(use-package vue-mode
  :ensure t
  :defer t
  :config
  (use-package vue-html-mode :ensure t :defer t)
  (setq mmm-submode-decoration-level 0))

;; == JSX & React ==
(use-package rjsx-mode
  :ensure t
  :defer t
  :config
  (defun emmet/rjsx-mode-hook ()
    (setq-default emmet-expand-jsx-className? t)
    (emmet-mode))
  (add-hook 'rjsx-mode-hook 'emmet/rjsx-mode-hook)
  (setq-default rjsx-indent-level 2))

;; == Tern ==
(use-package tern
  :ensure t
  :init
  (add-to-list
   'load-path
   "~/src-hub/tern/emacs/")
  (autoload 'tern-mode "tern.el" nil t)
  ;; :config
  ;; (use-package company-tern
  ;;   :ensure t
  ;;   :defer t)
  ;; (defun tern/js-mode-hook ()
  ;;   (add-to-list 'company-backends 'company-tern)
  ;;   (tern-mode t))
  ;; (add-hook 'js-mode-hook 'tern/js-mode-hook)
  )

;;; init-42-coding-web.el ends here
