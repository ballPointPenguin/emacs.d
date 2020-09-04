;;; init-10-face.el --- Customize the look of emacs

;;; Commentary:
;; doom-one theme
;; Hack font
;; sml respectful

;;; Code:
(require 'use-package)

;; Splash Screen to Org-mode
(setq inhibit-splash-screen t
      initial-scratch-message nil
      inhibit-startup-screen t
      initial-major-mode 'markdown-mode)

;; Load theme
(use-package doom-themes
       :ensure t
       :config
       (load-theme 'doom-one t)
       (doom-themes-visual-bell-config))

;; Set default fill column
(setq-default fill-column 80)

;; Disable menu bars, etc
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

;; Backup files to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Save more 'recent files'
(setq recentf-max-menu-items 127)
(setq recentf-max-saved-items 127)

;; Display line numbers and such
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;; Display full pathname in title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
     "%b"))))

;; Scrolling tweak
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Set font
(set-frame-font "Hack 12" nil t)

;; Customize the mode line
(use-package smart-mode-line-powerline-theme
       :ensure t)

(use-package smart-mode-line
       :ensure t
       :config
       (setq sml/theme 'respectful)
       (add-hook 'after-init-hook 'sml/setup))

;; shorten yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; init-10-face.el ends here
