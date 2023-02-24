{
  description = "Spacegame2 development with godot-4";
  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        pname = "spacegame2";
        version = "0.0.1";
        src = self;
        buildInputs = [ godot_4 ];
      };

  };
}
