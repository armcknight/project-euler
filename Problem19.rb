require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 19: How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)? (171)
    def problem19
        begin day,weekday,mon,year,sundays=0,1,0,1900,0 ensure sundays+=1 if([day,(weekday=(weekday+1)%7)]==[0,0]&&year>1900) until((year+=1 if(mon=(mon+1)%12 if(day=(day+1)%(mon==1?((year%400==0&&year%100==0)||(year%100!=0&&year%4==0)?29:28):([3,5,8,10].include?(mon)?30:31)))==0)==0)==2001) end

        puts "#{mon}/#{day}/#{year}, weekday=#{weekday}, sundays=#{sundays}"
    end
    
end