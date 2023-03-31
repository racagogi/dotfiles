;; Lazy opts.
(fn setup [plugins]
  (let [lazy (require :lazy)]
    (lazy.setup plugins)))

{:setup setup}
