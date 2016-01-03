# project-euler
###My solutions to Project Euler problems [https://projecteuler.net](https://projecteuler.net)
       
Unfortunately, you can't read any of the solutions, because I've encrypted them. You'd be able to run `decrypt.sh` if you had the private key. You'll just have to ask me nicely :)

-

##### Assuming you have the private key, or have broken 4096 bit RSA encryption,

You can run all solutions by invoking

       ruby all_solutions.rb

Each solution is packaged in its own file named Problem[#].rb in the following format:

       # [problem number]: [problem summary] ([answer])
       def problem[problem number]
           ...code...
           # return answer
       end
