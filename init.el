(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      
                      clojure-mode
                      rainbow-delimiters                      
                      cider

                      ;; Project navigation
                      projectile
                      ;; Vim support
                      evil
                      
                      solarized-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(evil-mode 1)


;; Project Navigation

(projectile-global-mode)                                                   ; Quickly navigate projects using Projectile (C-c p C-h for available commands)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) ; Projectile shows full relative paths

;; Visual 

(load-theme 'solarized-dark t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)                        ; Enable rainbow delimiters when programming   

;; Whitespace handler
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Line numbers

(global-linum-mode t)                                                      ; Always show line numbers on left
(setq linum-format "%4d ")                                                 ; Line numbers gutter should be four characters wide

(line-number-mode 1)                                                       ; Mode line shows line numbers
(column-number-mode 1)                                                     ; Mode line shows column numbers


(setq scheme-program-name "mit-scheme-x86-64")