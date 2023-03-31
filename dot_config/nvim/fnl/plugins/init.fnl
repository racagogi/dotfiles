(fn get-plugins []
  (let [plugins []
        path (.. (vim.fn.stdpath :config) :/fnl/plugins)]
    (each [fname (vim.fs.dir path)]
       (let [fname (fname:match "^(.*)%.fnl$")]
          (if (not (or (= :lazy fname)
                       (= :init fname)))
            (table.insert
                   plugins
                   (require (.. :plugins. fname))))))
    plugins))

(let [lazy (require :plugins.lazy)
      plugins (get-plugins)]
  (lazy.setup plugins))
