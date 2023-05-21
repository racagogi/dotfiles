;; Lazy opts.
(fn setup [plugins]
  (let [lazy (require :lazy)]
    (lazy.setup plugins
     {:dev {:path "~/plugins"}})))
{:setup setup}
