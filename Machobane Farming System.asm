#=========================================================================================================
#@name: Digital Innovators
#@purpose:to implement Machobane Farming System using MIPS assembly language
#@date: 13 November 2023
#@contacts:Digital Innovators
#============================================================================================================
#
#
#
#
.data 
#---------------------------------------------------------------------------------------------------------------------------------------------------
#The menu of the system
menu: .asciiz "\n------THE MACHOBANE FARMING SYSTEM------\n\n1. Soil Preparation\n2. Crop Planting\n3. Soil Maintanence\n4. Watering\n5. Harvesting\n6. Exit\n"
menu_choice: .asciiz "\nChoose activity you want to perform: "
invalid_choice: .asciiz "Invalid choice!. Please try again. "
#---------------------------------------------------------------------------------------------------------------------------------------------------
#Soil_Preparation()
soilprep:.asciiz "Inorder to prepare the soil for your plot, follow the following steps\n\n"
step1: .asciiz "1.Remove weeds\n"
step2: .asciiz "2.Add manure \n"
step3: .asciiz "3.Plough\n"
#----------------------------------------------------------------------------------------------------------------------------------------------------
#Crop_planting(string month, string plant)
prompt_month:  .asciiz "Enter month at which you want to plant (planting months are April(a), May(M), August(A), September(S), October(O))Key: Use letters in brackets to answer: "
prompt_plant_summer: .asciiz "Crops you can plant;\nFor Summer:\n 1. maize(m)\n 2. beans(b)\n 3. pumpkin(p)\n 4. sorghum(s)\n 5. watermelons(W)\n 6. groundnuts(g)\nEnter crop you want to plant: "
prompt_plant_winter: .asciiz "For Winter: \n1. Potatoes(P)\n 2. Peas(p)\n 3.Wheat(w) \nEnter crop you want to plant: "
harvMnths_winter: .asciiz "\nHarvest Months:- November - December\n\n"
harvMnths_summer: .asciiz "\nHarvest Months:- January - March\n\n"
input_plant: .space 32 #Plant input from the user
month: .space 10 #Month input

#Summer function
maize: .asciiz "This is how to intercrop maize with beans and pumpkin.\n@ @ @ @ @ @ @ @ @ @  maize \n^ ^ ^ ^ ^ ^ ^ ^ ^ ^ beans\n$ $ $ $ $ $ $ $ $ $ pumpkin\n"
beans: .asciiz "This is how to intercrop beans with maize and pumpkin.\n^ ^ ^ ^ ^ ^ ^ ^ ^ ^ beans\n@ @ @ @ @ @ @ @ @ @  maize\n$ $ $ $ $ $ $ $ $ $ pumpkin\n"
pumpkin: .asciiz "This is how to intercrop pumpkin with beans and maize.\n$ $ $ $ $ $ $ $ $ $ pumpkin\n^ ^ ^ ^ ^ ^ ^ ^ ^ ^ beans\n@ @ @ @ @ @ @ @ @ @  maize\n"
sorghum: .asciiz "This is how to intercrop sorghum with watermelons.\n* * * * * * * * * * sorghum\n- - - - - - - - - - watermelons\n"
watermelons: .asciiz "This is how to intercrop watermelons with sorghum.\n- - - - - - - - - - watermelons\n* * * * * * * * * * sorghum\n"
groundnuts: .asciiz "This is how to relay crop groundnuts with sorghum.\n+ + + + + + + + + + groundnuts\n* * * * * * * * * * sorghum\n"

#winter function
potatoes: .asciiz "\nThis is how to intercropp Potatoes and Peas\n.@ @ @ @ @ @ @ @ @ @ potatoes \n^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ peas\n"
peas: .asciiz "^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ peas\n"
wheat: .asciiz "\nThis is how to relay crop, wheat and potatoes\n$ $ $ $ $ $ $ $ $ $ wheat\n@ @ @ @ @ @ @ @ @ @  potatoes \n"

#-----------------------------------------------------------------------------------------------------------------------------------------------------
#Soil_Maintenance(int No_times_manure_added)
manure_added: .asciiz "Enter number times manure is added(max = 4): "
little: .asciiz "\nSoil fertility is 45% and is not encouraged!"
overRequired: .asciiz "Soil fertility is 95% and you have reached the max fertility"
acceptable: .asciiz "Soil fertility is 60% and it is acceptable"
manure: .space 4
#-----------------------------------------------------------------------------------------------------------------------------------------------------
#moisture_level()
prompt_rain: .asciiz "Did it rain today? Answer [Y or N]: "
prompt_season: .asciiz "Which season is it? Winter or Summer[W/S]? "
message_no_water: .asciiz "Do not water plants\n"
summer_response: .asciiz "Water using 2 full watering cans early in the morning and 2 full watering cans late in the afternoon."
winter_response: .asciiz "Water using 1 full watering can late in the morning and water using 1 full watering can early in the afternoon."
rain: .space 10
season: .space 10
invalid_answer: .asciiz"Inavalid input. Try again: "
#------------------------------------------------------------------------------------------------------------------------------------------------------
#Harvesting
amnt_of_crops: .asciiz "Enter total amount of crops (i.e no. of kgs)."
yield_Percrop: .asciiz "Enter amount of yield per crop(i.e kg per crop)."
numberofcrops: .space 4
yieldpercrop: .space 4
yield: .space 32 #amnt0fCrps * yeldPerCrops * soil_Fertility/100
calculated_yield: .asciiz "Calculated yield: "
#-------------------------------------------------------------------------------------------------------------------------------------------------------
.text 
main: 

menue_loop:
# Prints menu
     li $v0, 4
     la $a0, menu  
     syscall
#massage prompt
     li $v0, 4
     la $a0, menu_choice
     syscall
#Enter activity
     li $v0, 5         
     syscall
     move $t0, $v0 #Store user input in $t0
     #Handle user choice
     beq $t0, 1, go_to_siolPrep #If matches go to soil preparation
     beq $t0, 2, go_to_CropPlanting
     beq $t0, 3, go_to_soil_maintanance
     beq $t0, 4, go_to_moisture_level
     beq $t0, 5, go_to_Harvesting
     beq $t0, 6, endProgram
      
     #invalide choice
     li $v0, 4
     la $a0, invalid_choice
     syscall
     j menue_loop
#function for soil preparation
#------------------------------------------------------------------------------------------------------------------------------------------------------
go_to_siolPrep:
        li $v0,4
        la $a0,soilprep
	syscall
	li $v0,4
	la $a0,step1
	syscall
	li $v0,4
	la $a0,step2
	syscall
	li $v0,4
	la $a0,step3
	syscall
        
        j menue_loop
#end of soil preparation---------------------------------------------------------------------------------------------------------------------------------
#Function for Crop Planting
#--------------------------------------------------------------------------------------------------------------------------------------------------------
go_to_CropPlanting:
#crop planting
	li $v0, 4
	la $a0, prompt_month
    	syscall

    	li $v0, 8 
    	la $a0, month
    	la $a1, 10
    	syscall
 
    	j crop_planting
crop_planting:
	la $t0, month
	la $t1, 'A'
	la $t3, 'S'
	la $t4, 'O'
	la $t5, 'a'
	la $t6, 'M'
	lb $t2, 0($t0)
    	# Check if the month is August, September, or October
        beq $t2, $t1, go_to_summer
        beq $t2, $t3, go_to_summer
        beq $t2, $t4, go_to_summer
        
        #Check if the month is April or May
        beq $t2, $t5, go_to_winter
        beq $t2, $t6, go_to_winter
        
   	j menue_loop
#Summer function	
go_to_summer:
       	li $v0, 4
    	la $a0, prompt_plant_summer
    	syscall
        
    	li $v0, 8
    	la $a0, input_plant # assuming a fixed buffer size of 32 characters for plant
    	li $a1, 32
    	syscall
        #Harvest months
        li $v0, 4
        la $a1, harvMnths_summer
        syscall
        
 loop1:
   	la $t0, input_plant
	la $t1, 'm'    #Character to compare with input
	lb $t2, 0($t0) #The first character of input
	beq $t2,$t1, in_maize #Compares the characters
        bne $t2,$t1, loop2  #If no match found loops to next loop
loop2:        
	la $t3, 'b'  #Character to compare with input
 	beq $t3, $t2, in_beans #Compares the characters
 	bne $t3,$t1, loop3  #If no match found loops to next loop
loop3: 	
	la $t4, 'p'  #Character to compare with input
 	beq $t4, $t2, in_pumpkin #Compares the characters
 	bne $t4,$t1, loop4 #If no match found loops to next loop
 loop4:	
	la $t5, 's'  #Character to compare with input
 	beq $t5, $t2, in_sorghum #Compares the characters
 	bne $t5,$t1, loop5 #If no match found loops to next loop
loop5: 	 
 	la $t6, 'W'  #Character to compare with input
 	beq $t6, $t2, in_watermelons #Compares the characters
 	bne $t6,$t1, loop6 #If no match found loops to next loop
loop6:	
 	la $t7, 'g'  #Character to compare with input
        beq $t7, $t2, in_groundnuts #Compares the characters
        bne $t7,$t1, menue_loop #If no match found, endProgram
        
in_maize:
    li $v0, 4
    la $a0, maize 
    syscall
    j menue_loop
in_beans:
    li $v0, 4
    la $a0, beans
    syscall
    j menue_loop
in_pumpkin:
    li $v0, 4
   la $a0, pumpkin
   syscall
    j menue_loop
in_sorghum:
    li $v0, 4
    la $a0, sorghum
    syscall
    j menue_loop
in_watermelons:
   li $v0, 4
    la $a0, watermelons
    syscall
    j menue_loop
in_groundnuts:
    li $v0, 4
    la $a0, groundnuts
    syscall
    j menue_loop

#End of summer function---------------------------------------------
#Winter function
go_to_winter:
	li $v0, 4
    	la $a0, prompt_plant_winter
    	syscall
        
    	li $v0, 8
    	la $a0, input_plant # assuming a fixed buffer size of 32 characters for plant
    	li $a1, 32
    	syscall
        
	la $t0, input_plant
	la $t1,'w'
	lb $t2, 0($t0)
	beq $t2,$t1, relaycrop
	bne $t2,$t1, loop
	#Harvest months
        li $v0, 4
    	la $a1, harvMnths_winter
    	syscall
loop:	
	la $t3, 'p'
	la $t4, 'P'
	beq $t2,$t4, intercrop
	beq $t2,$t3, intercrop
	bne $t2,$t3, menue_loop 
	
relaycrop:
	li $v0,4
	la $a0,wheat
	syscall
	j menue_loop
intercrop:
	li $v0,4
	la $a0,potatoes
	syscall
	j menue_loop

#end of Crop Planting-----------------------------------------------------------------------------------------------------------------------------------
#soil_maintanance function
#-------------------------------------------------------------------------------------------------------------------------------------------------------
go_to_soil_maintanance:
	li $v0, 4
	la $a0, manure_added
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 4
	ble $t0, 2, too_little
	bgt $t0, 4, max_fertility
	bgt $t0, 2, required
	
too_little:
	li $v0, 4
	la $a0, little
	syscall
	j menue_loop
					
required:
	li $v0, 4
	la $a0, acceptable
	syscall
	j menue_loop
	
max_fertility: 
	li $v0, 4
	la $a0, overRequired
	syscall
	j menue_loop
#end of soil_maintanance function----------------------------------------------------------------------------------------------------------------------
#Function for moisture level
#------------------------------------------------------------------------------------------------------------------------------------------------------
go_to_moisture_level:
	 # Prompt for rain
    	li $v0, 4            # syscall: print_str
    	la $a0, prompt_rain  # load address of the string prompt_rain
    	syscall

   	# Read input into $t0
    	li $v0, 8            # syscall: read_string
    	la $a0, rain         # load address of the rain string
    	li $a1, 10          # maximum length of the string
    	syscall

    	# Check if rain is "Yes" or "yes"
    	la $t1, rain
    	li $t2, 'Y'
    	li $t3, 'y'
    	lb $t4, 0($t1)
    	beq $t4, $t2, is_yes  # branch to is_yes if rain starts with 'Y'
    	beq $t4, $t3, is_yes  # branch to is_yes if rain starts with 'y'

    	# Check if rain is "No" or "no"
    	li $t2, 'N'
    	li $t3, 'n'
    	lb $t4, 0($t1)
    	beq $t4, $t2, is_no   # branch to is_no if rain starts with 'N'
    	beq $t4, $t3, is_no   # branch to is_no if rain starts with 'n'

    	# invalid_input if rain is neither "Yes" nor "No"
    	li $v0, 4
    	la $a0,invalid_answer
    	j go_to_moisture_level     

is_yes:
   	# Print "Do not water plants"
    	li $v0, 4                # syscall: print_str
    	la $a0, message_no_water # load address of the string message_no_water
    	syscall
    	j menue_loop

is_no:
    	# Prompt for season
    	li $v0, 4               # syscall: print_str
    	la $a0, prompt_season   # load address of the string prompt_season
    	syscall

    	# Read input into $t0
    	li $v0, 8               # syscall: read_string
    	la $a0, season          # load address of the season string
    	li $a1, 10             # maximum length of the string
    	syscall
    
    	#Check if season is "Summer" 
    	la $t5, season
    	li $t6, 'S'
    	lb $t7, 0($t5)
    	beq $t7, $t6, is_summer
    
    	#Check if season is "Winter"
    	la $t5, season
    	li $t6, 'W'
    	lb $t7, 0($t5)
    	beq $t7, $t6, is_winter
    	#invalid input
        li $v0, 4
    	la $a0,invalid_answer
    	j is_no
        
is_summer:
     	li $v0, 4
     	la $a0, summer_response
     	syscall
     	j menue_loop 
     
	is_winter:
      	li $v0, 4
      	la $a0, winter_response
      	syscall
        j menue_loop
#End of moisture level----------------------------------------------------------------------------------------------------------------------------
#Function for Harvesting
#-------------------------------------------------------------------------------------------------------------------------------------------------
go_to_Harvesting:
	li $v0,4
	la $a0, amnt_of_crops
	syscall
	li $v0,5
	la $t0, numberofcrops
	la $a2, 4
	syscall
	li $v0,4
	la $a0, yield_Percrop
	syscall
	li $v0,5
	la $t1,yieldpercrop
	la $a1, 4
	syscall
	li $v0,4
	la $a0,manure_added
	syscall
	li $v0,5
	la $t2,manure
	la $a3, 4
	syscall
	mul $t3,$t0,$t1
	mul $t3,$t3,$t2
	addi $t5,$zero,100
	div $t4,$t3,$t5
	
	# calculated yield
	li $v0, 4
	la $a0, calculated_yield
	syscall
	li $v0, 1	
	move $a0,$t4
	syscall
	
	j menue_loop
#End of harvesting function------------------------------------------------------------------------------------------------------------------------
endProgram:
       li $v0, 10
       syscall
