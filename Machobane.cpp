#include <iostream>
#include <string>

using namespace std;

int No_times_manure_added;
int soil_Fertility;
string month, plant; 
void summer();
void winter();
void crop_planting(string month);
void soil_maintanence(int No_times_manure_added);
void harvesting();

void crop_planting(string month){

    if (month == "August" || month == "September" || month=="October"){
        summer();
        
    }

    else if (month == "April"|| month == "May"){
        winter();       
        
    }    

    else
        cout << month << " is not a planting month\n\n";
}

void summer(){
    cout << "\nEnter crop you want to plant: ";
	cin >> plant;
    string plants[6] = {"maize", "beans", "pumpkin", "sorghum", "watermelons", "groundnuts"};
    for (int i = 0; i < 6; i++){
        if (plant == plants[i]){     	
            if(plant == plants[0] || plant == plants[1] || plant == plants[2]){
                cout << "you can intercrop maize with (beans & pumpkin) \n\n"; //intercropping
                cout << "\nHere is how to plant\n";
                cout << "\n+ + + + + + + + + + + + + + + maize";
                cout << "\n* * * * * * * * * * * * * * * beans";
                cout << "\n- - - - - - - - - - - - - - - pumpkin\n";
            }
            else if (plant == plants[4] || plant == plants[5]){
                cout << "you can intercrop watermelons with (groundnuts) \n\n"; //intercropping
                cout << "\nHere is how to plant\n";
                cout << "\n` ` ` ` ` ` ` ` ` ` ` ` ` ` ` watermelons";
                cout << "\n, , , , , , , , , , , , , , ,groundnuts\n";
            }
            else if(plant == plants[3]){
                cout << "sorghum & maize (relay cropping)\n\n"; //relay cropping 
				cout << "\nHere is how to plant\n";
                cout << "\n# # # # # # # # # # # # # # #  sorghum";
                cout << "\np+ + + + + + + + + + + + + + + maize\n";  
            }
           
        }
    }
    cout << "\nHarvest Months:- January - March\n\n";
}

void winter(){
    cout << "\nEnter crop you want to plant: ";
	cin >> plant;
    string plants[3] = {"wheat", "peas", "potatoes"};
    for (int i = 0; i < 3; i++){
        if (plant == plants[i]){
            if(plant == plants[1] || plant == plants[2]){
                cout << "potatoes & peas (intercropping)\n\n"; //intercropping
                cout << "\nHere is how to plant\n";
                cout << "\n@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ potatoes";
                cout << "\n^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^peas\n"; 
				
            }
            else if (plant == plants[0]){
                cout << "Wheat & potatoes (relay cropping)\n\n"; //relay cropping
                cout << "\nHere is how to plant\n";
                cout << "\n$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ wheat";
                cout << "\n@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ potatoes\n"; 
				 
            }
        }
    }
   cout << "\nHarvest Months:- November - December\n\n";
}


void soil_prep(){
	cout << "\ninorder to prepare the soil for your plot, follow this steps: \n" << "1. Remove weeds \n" << "2. Add manure \n" << "3. Plough" << endl;
}

void soil_maintanence(int No_times_manure_added){
	int max_manure = 4;

	cout << "\nEnter number of times manure is added(max = 4): ";
		cin >> No_times_manure_added;
	
	if(No_times_manure_added <= max_manure/2){
		soil_Fertility = 45;
		cout << "\nSoil fertility is " << soil_Fertility << "%, and it is not encouraged!\n";
	}
	else if(No_times_manure_added > max_manure/2 && No_times_manure_added < max_manure){
		soil_Fertility = 60;
		cout << "\nSoil fertility is " << soil_Fertility << "%, and it is accepteble\n";
	}
	else{
		soil_Fertility = 95;
		cout << "\nSoil fertility is " << soil_Fertility << "%, and you have reached the max fertility\n";
	}
}

void harvesting(){
	int yield, amnt0fCrps, yeldPerCrops;
	cout << "Enter total amount of crops yield: ";
	cin >> amnt0fCrps;
	cout << "Enter amount yield per crops: ";
	cin >> yeldPerCrops;
	soil_maintanence(No_times_manure_added);
	yield = amnt0fCrps + yeldPerCrops + soil_Fertility;

	cout << "Total Yield is: " << yield << endl;
}
void mois_level(){
	string rain;
	cout << "\nDid it rain today? \t Answer using Yes or No: ";
	cin >> rain;
	if(rain == "Yes" || rain =="yes")
	{
		cout << "\nDo not water plants\n";
	}
	else if(rain == "No" || rain =="no"){
	string season;
	cout << "\nWhich season is it? \t Winter or Summer? ";
	cin >> season;
		if(season == "Winter" || season == "winter" ){
		cout << "\nWater using 1 full watering can late in the morning and water using 1 full watering can early in the afternoon.\n";
		}
		else if(season == "Summer" || season == "summer")
		{
		cout << "\nWater using 2 full watering cans early in the morning and 2 full watering cans late in the afternoon\n";
		}
		else
	   	cout << "\nYou chose an unknown season\n";
		}
	else
		cout << "\nYou enter the wrong option\n";
	}
void menu(){
    int choice;
	
    	cout << "\n------THE MACHOBANE FARMING SYSTEM------\n";
    	cout << "\n1. Soil Preparation";
    	cout << "\n2. Crop Planting";
    	cout << "\n3. Soil Maintanence";
    	cout << "\n4. Watering";
    	cout << "\n5. Harvesting";
		cout << "\nChoose activity you want to perform: ";
    	cin >> choice;
	if(choice == 1){
		soil_prep();
		}

	else if(choice == 2){
		cout << "\nEnter month at which you want to plant(e.g April): ";
		cin >> month;
		
		crop_planting(month);
		}

	else if(choice == 3){
		soil_maintanence(No_times_manure_added);	
		}

	else if(choice == 4){
		mois_level();
		}

	else if(choice == 5){
		harvesting();
		}

	else  
		cout <<  "Invalid Key";
}	


int main(){

		menu();

	return 1;
}