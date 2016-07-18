;;================================================================
;;  Base improvements
;;================================================================

;; Remove menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Package manager (el-get)
;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working el-get.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
(package-initialize)

;; Set backup directory
(setq backup-directory-alist `(("." . "~/.emacs_backups")))

;; Copy to clipboard support (no need on Emacs GUI)
;; (defun yank-to-x-clipboard ()
;;   (interactive)
;;   (if (region-active-p)
;;         (progn
;; 	    (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
;; 	      (message "Yanked region to clipboard!")
;; 	        (deactivate-mark))
;;     (message "No region active; can't yank to clipboard!")))
;; (global-set-key (kbd "C-c C-v") 'yank-to-x-clipboard)

;; Font size
(set-face-attribute 'default nil :height 100)

;; Run diff on example files
(defun diff-example ()
  (interactive)
  (let ((difffile (concat (buffer-file-name) ".example")))
     (diff difffile (buffer-file-name))
  ))
(global-set-key (kbd "C-c d") 'diff-example)

;; Comment/Uncomment key bindings
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;;================================================================
;;  Plugin changes
;;================================================================
;; Flx - ido (flx, ido-better-flex, ido-vertical-mode)
(require 'flx-ido)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-better-flex/enable)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Magit Call (magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; Company Complete binding
(global-set-key (kbd "C-c TAB") 'company-complete)

;; Fish indent
(defun fish-ajust-tab ()
  "Call fish_indent when pusing tab"
  (local-set-key (kbd "TAB") 'fish_indent)
  )
(add-hook 'fish-mode-hook 'fish-ajust-tab)

;; FoldThis
(global-set-key (kbd "C-c f") 'fold-this)

;; M-x improvement
(global-set-key (kbd "M-x") 'smex)

;; OCaml
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

;; HaXe
(add-to-list 'load-path "~/.emacs.d/funda-haxe-mode")

;; EMMS
(setq exec-path (append exec-path '("/usr/bin")))
(add-to-list 'load-path "~/.emacs.d/site-lisp/emms-mplayer")
(require 'emms-player-mplayer)
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

;;================================================================
;; Rails
;;================================================================

;;--- Ruby vanilla mode
;; Remove deep indent
(setq ruby-deep-indent-paren nil)
;;--- Ruby plugins
;; Use good ruby version (rbenv-mode)
(require 'rbenv)
(global-rbenv-mode)
;; Syntax checking
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
;; Bind inf-ruby to key (inf-ruby)
(global-set-key (kbd "C-c r q") 'inf-ruby-console-auto)
;; Company (Code completion)
(require 'company)
(add-hook 'ruby-mode-hook 'company-mode)
;; RSpec (rspec-mode)
(require 'rspec-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup) ;; use pry with rspec mode (C-x C-q)
;; Activate yard in rb files
(add-hook 'ruby-mode-hook 'yard-mode)
;; Ruby refactor
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
;;--- Rails plugins
;; Projectile for rails
(add-hook 'ruby-mode-hook 'projectile-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(coffee-indent-tabs-mode nil)
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("72c7c8b431179cbcfcea4193234be6a0e6916d04c44405fc87905ae16bed422a" default)))
 '(dabbrev-abbrev-skip-leading-regexp ":")
 '(ido-use-faces nil)
 '(indent-tabs-mode nil)
 '(magit-branch-arguments nil)
 '(rspec-command-options "--format progress --order defined --fail-fast")
 '(rspec-compilation-skip-threshold 2)
 '(rspec-spec-command "rspec")
 '(rspec-use-opts-file-when-available nil)
 '(rspec-use-rake-when-possible nil)
 '(rspec-use-rvm nil)
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(show-trailing-whitespace nil)
 '(standard-indent 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(yaml-tab-face ((t (:background "color-52" :foreground "red" :weight bold)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(load "funda-haxe-mode")
