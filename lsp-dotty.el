;;; lsp-dotty.el --- Dotty support for lsp-mode

;; Version: 1.0
;; Package-Requires: ((emacs "25.1") (lsp-mode "4.0"))
;; Keywords: scala
;; URL: https://github.com/lampepfl/lsp-dotty

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'lsp-mode)

;;;###autoload
(defun lsp-dotty--ls-command ()
  (let ((server-jar "")
        (server-config ""))
    `( "coursier"
       "launch"
       "ch.epfl.lamp:dotty-language-server_0.1:0.1.1-bin-SNAPSHOT"
       "-M"
       "dotty.tools.dotc.interactive.Main"
       "--"
       "-stdio"
       )))

(defun lsp-dotty--get-root ()
  (lsp-make-traverser "project"))

(lsp-define-stdio-client
 lsp-scala-mode
 "scala"
 (lsp-dotty--get-root)
 (lsp-dotty--ls-command))

(add-hook 'scala-mode-hook #'lsp-scala-mode-enable)

(provide 'lsp-dotty)
;;; lsp-dotty.el ends here
