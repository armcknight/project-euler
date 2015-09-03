require "./mathematics_classes"
include Mathematics

# 15: Starting in the top left corner of a 20×20 grid, and only being able to move to the right and down, how many possible routes are there? (137846528820)
def problem15
    row = [1, 1]
    n = 20
    (2*n-1).times do |m|
        str = ""
        row.each do |r|
            str << r.to_s << " "
        end
        #puts str
        newRow = Array.new
        newRow << 1
        (row.count-1).times do |x|
            newRow << row[x] + row[x+1]
        end
        newRow << 1
        row = Array.new(newRow)
    end
    row[n]
end