(ns build
  (:gen-class)
  (:require [clojure.tools.build.api :as b]))

(def lib 'io.codecrafters.{{course_slug}})
(def class-dir "/tmp/codecrafters-build-{{course_slug}}-clojure/classes")
(def basis (b/create-basis {:project "deps.edn"}))
(def uber-file "/tmp/codecrafters-build-{{course_slug}}-clojure/target.jar")

(defn clean [_]
  (b/delete {:path "/tmp/codecrafters-build-{{course_slug}}-clojure"}))

(defn uber [_]
  (clean nil)
  (b/copy-dir {:src-dirs ["src"] :target-dir class-dir})
  (b/compile-clj {:basis basis
                  :ns-compile '[{{course_slug}}.core]
                  :class-dir class-dir})
  (b/uber {:class-dir class-dir
           :uber-file uber-file
           :basis basis
           :main '{{course_slug}}.core}))
