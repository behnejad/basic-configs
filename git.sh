# ~/.ssh/config
StrictHostKeyChecking no
HOST	gitlab.com
	    HostName gitlab.com
    	IdentityFile /h/id_rsa
	    User git
      Port 22
      PubkeyAuthentication yes


ssh-agent $(ssh-add /media/id_rsa; git pull --all)

git config core.autocrlf true/false
git config --global core.fileMode false
git config core.sshCommand "ssh -i /media/veracrypt1/id_rsa"
git check-ignore -- *
git check-ignore -v -- *

ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
