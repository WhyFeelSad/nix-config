{ myvars, ... }:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      userName = "${myvars.userName}";
      userEmail = "${myvars.gitEmail}";

      # signing = {
      #   key = "xxx";
      #   signByDefault = true;
      # };

      extraConfig = {
        init.defaultBranch = "main";
        trim.bases = "develop,master,main"; # for git-trim
        push.autoSetupRemote = true;
        pull.rebase = true;

        # replace https with ssh
        url = {
          "ssh://git@github.com/WhyFeelSad" = {
            insteadOf = "https://github.com/WhyFeelSad";
          };
          # "ssh://git@gitlab.com/" = {
          #   insteadOf = "https://gitlab.com/";
          # };
          # "ssh://git@bitbucket.com/" = {
          #   insteadOf = "https://bitbucket.com/";
          # };
        };

        # A syntax-highlighting pager in Rust(2019 ~ Now)
        delta = {
          enable = true;
          options = {
            diff-so-fancy = true;
            line-numbers = true;
            true-color = "always";
            # features => named groups of settings, used to keep related settings organized
            # features = "";
          };
        };

        aliases = {
          # common aliases
          br = "branch";
          co = "checkout";
          st = "status";
          ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
          ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
          cm = "commit -m"; # commit via `git cm <message>`
          ca = "commit -am"; # commit all changes via `git ca <message>`
          dc = "diff --cached";

          amend = "commit --amend -m"; # amend commit message via `git amend <message>`
          unstage = "reset HEAD --"; # unstage file via `git unstage <file>`
          merged = "branch --merged"; # list merged(into HEAD) branches via `git merged`
          unmerged = "branch --no-merged"; # list unmerged(into HEAD) branches via `git unmerged`
          nonexist = "remote prune origin --dry-run"; # list non-exist(remote) branches via `git nonexist`

          # delete merged branches except master & dev & staging
          #  `!` indicates it's a shell script, not a git subcommand
          delmerged = ''! git branch --merged | egrep -v "(^\*|main|master|dev|staging)" | xargs git branch -d'';
          # delete non-exist(remote) branches
          delnonexist = "remote prune origin";

          # aliases for submodule
          update = "submodule update --init --recursive";
          foreach = "submodule foreach";
        };
      };
    };
  };
}
