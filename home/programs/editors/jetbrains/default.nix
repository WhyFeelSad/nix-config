{ pkgs, ... }:
let
  jetbra = pkgs.fetchFromGitHub {
    owner = "WhyFeelSad";
    repo = "jetbra";
    rev = "631a187dfe45652f23a0d0b0a030abccc6c648f9";
    sha256 = "sha256-FvjwrmRE9xXkDIIkOyxVEFdycYa/t2Z0EgBueV+26BQ=";
  };

  vmoptions = ''
    --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
    --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

    -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
    -Dawt.toolkit.name=WLToolkit
  '';
in
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.datagrip
  ];

  xdg.configFile."JetBrains/IntelliJIdea${pkgs.jetbrains.idea-ultimate.version}/idea64.vmoptions".text =
    vmoptions;
  xdg.configFile."JetBrains/DataGrip${pkgs.jetbrains.datagrip.version}/idea64.vmoptions".text =
    vmoptions;
}
