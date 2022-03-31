{
        description = "A flake to check if i can get this to work"

        inputs.nixpkgs.url = "github:NixOS/nixpkgs/6d8215281b2f87a5af9ed7425a26ac575da0438f";

        outputs = inputs@{ self, nixpkgs };
        in with import nixpkgs { inherit system; }

        let python = python39;
        in rec {

                devShell."${system}" = mkShell {
                        packages = [
                                (python.withPackages
                                        (ps: with ps; [ numpy ]))
                                unzip
                        ];

                };

        };
}
