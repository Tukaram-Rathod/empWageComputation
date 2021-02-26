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

while [[ $totalEmpHours -lt $maxHoursAMonth && $totalWorkingDays -lt $workingDaysAMonth ]]
do
                ((totalWorkingDays++))
                workingHours="$( getWorkingHours $((RANDOM %3 )) )";
                (( totalEmpHours+=workingHours ))

done

salary=$(( totalEmpHours * empWagePerHour ))
echo "total salary is $salary ";
