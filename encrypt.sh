# encrypt solution source code
ls Problem*.rb | xargs -I {} gpg -e -u "armcknight/project-euler" -r "armcknight/project-euler" {}
gpg -e -u "armcknight/project-euler" -r "armcknight/project-euler" functions.rb
gpg -e -u "armcknight/project-euler" -r "armcknight/project-euler" language.rb
gpg -e -u "armcknight/project-euler" -r "armcknight/project-euler" mathematics_classes.rb
gpg -e -u "armcknight/project-euler" -r "armcknight/project-euler" mathematics_functions.rb

# remove plaintext verions
ls Problem*.rb | xargs -I {} rm {}
rm functions.rb
rm language.rb
rm mathematics_classes.rb
rm mathematics_functions.rb
