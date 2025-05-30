(ns build
  (:gen-class)
  (:require [clojure.tools.build.api :as b]))

(def lib 'com.codecrafters.{{course_slug}})
(def version (format "0.1.%s" (b/git-count-revs nil)))
(def class-dir "target/classes")
(def basis (b/create-basis {:project "deps.edn"}))
(def uber-file "target/{{course_slug}}.jar")

(defn clean [_]
  (b/delete {:path "target"}))

(defn uber [_]
  (clean nil)
  (b/copy-dir {:src-dirs ["src/main"]
               :target-dir class-dir})
  (b/compile-clj {:basis basis
                  :ns-compile '[{{course_slug}}.core]
                  :class-dir class-dir})
  (b/uber {:class-dir class-dir
           :uber-file uber-file
           :basis basis
           :main '{{course_slug}}.core}))
