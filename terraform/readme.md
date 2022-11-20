before u start
--------------
16/11/2022
* terraform need a local demon installation 
    * run 'brew tap hashicorp/tap'
    * then run 'brew install hashicorp/tap/terraform'
    * then run 'brew update' (to update brew)
    * then run 'brew upgrade hashicorp/tap/terraform' (to update terraform)
    * then run 'terraform -help' (to make sure installtion worked correctly)
* install auto complete
    * run 'touch ~/.bashrc' for bash users or 'touch ~/.zshrc' for zsh users
    * run 'terraform -install-autocomplete'
    * close the shell and reopen



important to understand
-----------------------
1) terafform create/update/delete
    terraform basicaly is an updating engine that on each 'terraform apply' command makes sure
    that the resorces (containers, config maps, ec2, compute engines | any cloud resource) are
    equal to the resources mentioned on each of the .tf files on this folder.
    if there is only one .tf file and it is emply, we run 'terraform apply' => nothing will
    happen, if we will write down two resorces and run 'terraform apply', terraform will create
    them, we delete one, run 'apply' terraform will delete on the cloud the resorce we deleted 
    here on the file, we change one, run apply, terraform will update it on the cloud... ETC..
2) dependent resources
    some resorces are dependent on other, example: a container can depand on a config map in
    order to load correctly. basiclly terraform have an automatic way to create resorces in 
    the correct order, but, for edge cases, we can mantion what resoreces or dependent on 
    what resorces and terraform will create the resorces accordingly



terminal commands
-----------------
* terraform fmt
    * formats all the code files in the folder (like Bautify)
* terraform init
    * downloads provider plugins (docker / gcp / asw / azure...)
    * cretes a '.terraform.lock' file, like package-lock.json, it is a file that helps terraform to keep track of the plugin's installed and plugin versions
* terraform apply
    * creates all the resources in the provider 
    * creates a 'terraform.tfstate' file, a very important file that helps terraform keep track on
    the resocres, if this files is deleted terrafom losses connection with all resocrces
* terraform destroy
    * just deletes all resocruces
    * dose not delete any provider resorces that wasnt created (managed) by this terraform folder
    (let say before running terraform U had 3 ec2 instances on aws, if U apply/distroy/any other command - terraform will never take any action on the ec2 instances U had before)
