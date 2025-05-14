#Factors in R

#Summary of numeric items
partcipants_age=c(78, 25, 68, 45, 48, 36)
summary(partcipants_age)

#Finding summary of characters
profession= c("Doctor", "Teacher", "Teacher", "Businessman", "Teacher")
summary(profession)


profession= factor(profession)
summary(profession)

#Putting the summary in order
birth_month= c("January", "December" ,"April", "August", "January", "March", "June", "April", "July", "August", "September", "April", "October", "July", "September")
summary(birth_month)
birth_month_fact= factor(birth_month,
                         ordered = TRUE, 
                         levels = c("January", "Februdary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ))
summary(birth_month_fact)

# Lists in R
# Lists are used to place number of items in a bundle

a=c(2, 4, 7)
b=c("Red", "Green", "Blue")
c= "Welcome!"

my_list= list(a, b, c)

my_list



# Naming the list items
my_list= list(Pieces = a, Colors = b, Message = c)
my_list

#Calling a specific data structure
my_list[3]
my_list['Colors']
my_list$Colors

#calling specific items the data structure
my_list$Colors[3]
