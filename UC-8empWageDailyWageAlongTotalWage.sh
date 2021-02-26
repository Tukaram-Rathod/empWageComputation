#!/bin/bash -x
isPartTime=1;
isFullTime=2;
empWagePerHour=20;
workingDaysAMonth=20;
maxHoursAMonth=100;
totalEmpHours=0;
totalWorkingDays=0;

function getWorkingHours() {
        case $1 in
                $isFullTime)
                        numberofWorkingHours=8
                        ;;
                $isPartTime)
                        numberofWorkingHours=4
                        ;;
                *)
                        numberofWorkingHours=0
                        ;;
                esac
                echo $numberofWorkingHours

}

function calculateWage() {
        workingHours=$1;                                                                                                                                                        wage=$(( workingHours*empWagePerHour ));                                                                                                                                echo $wage                                                                                                                                                      }
	wage=$(( workingHours*empWagePerHour ));
        echo $wage
}

while [[ $totalEmpHours -lt $maxHoursAMonth && $totalWorkingDays -lt $workingDaysAMonth ]]
do
        ((totalWorkingDays++))
        workHours="$( getWorkingHours $((RANDOM % 3 )) )";
        (( totalEmpHours+=workHours ));
        empDailyWage[$totalWorkingDays]="$(calculateWage $workHours)";

done

monthlySalary="$( calculateWage $totalEmpHours )";
echo "Monthly salary $monthlySalary";
echo "Daily wage ${empDailyWage[@]}"

salary=$(( totalEmpHours*empWagePerHour ))
echo "salary per month is $salary ";

