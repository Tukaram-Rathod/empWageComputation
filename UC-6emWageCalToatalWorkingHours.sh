#!/bin/bash -x

#CONSTANTS
isPartTime=1;
isFullTime=2;
empWagePerHour=20;
workingDaysAMonth=20;
maxHoursAMonth=100;
totalEmpHours=0;
#VARIABLES
#numWorkingDays=20;
totalWorkingDays=0;


while [[ $totalEmpHours -lt $maxHoursAMonth && $totalWorkingDays -lt $workingDaysAMonth ]]
do
                ((totalWorkingDays++))
                empCheck=$((RANDOM%3));
                case $empCheck in
                        $isFullTime)
                                numberofWorkingHours=8
                                ;;
                        $isPartTime)
                                numberofWorkingHours=4
                                ;;
                        *)
                                numberofWorkingHours=0
                                ;;                                                                                                                                                                                                                                                                                                                              esac
                (( totalEmpHours+=numberofWorkingHours ))
done

totalSalary=$(( totalEmpHours * empWagePerHour ))
echo "total salary is $totalSalary ";

