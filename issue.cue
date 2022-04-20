package main


import (
    "dagger.io/dagger"
    "universe.dagger.io/alpine"
    "universe.dagger.io/bash"
)


dagger.#Plan & {
    client: filesystem: "output.txt": write: contents: actions.test.export.files["/hello.txt"]

    actions: {
        _image: alpine.#Build & {
            packages: bash: {}
        }
        test: bash.#Run & {
            input: _image.output
            script: contents: "echo Hello World! > /hello.txt"
            export: files: "/hello.txt": string
        }

    }
}