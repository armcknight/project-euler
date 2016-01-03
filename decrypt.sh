# decrypt solution source code
ls Problem*.rb.gpg | sed -e 's/.rb.gpg/.rb/g' | xargs -I {} gpg -o {} -d {}.gpg
gpg -d functions.rb.gpg > functions.rb
gpg -d language.rb.gpg > language.rb
gpg -d mathematics_classes.rb.gpg > mathematics_classes.rb
gpg -d mathematics_functions.rb.gpg > mathematics_functions.rb
