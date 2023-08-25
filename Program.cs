using System;

namespace DateDifferenceCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime startDate = new DateTime(2020, 1, 15);
            DateTime endDate = new DateTime(2023, 8, 25);

            TimeSpan difference = endDate - startDate;

            int totalDays = difference.Days;
            int totalWeeks = totalDays / 7;

            int years = endDate.Year - startDate.Year;
            int months = endDate.Month - startDate.Month;
            if (months < 0)
            {
                years--;
                months += 12;
            }

            Console.WriteLine($"Difference in days: {totalDays} days");
            Console.WriteLine($"Difference in weeks: {totalWeeks} weeks");
            Console.WriteLine($"Difference in months: {months} months");
            Console.WriteLine($"Difference in years: {years} years");
            Console.WriteLine($"Difference: {years} years and {months} months");
            Console.ReadKey();
        }
    }
}
