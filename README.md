from-the-real-world
===================

Proving to a random stranger on the internet that I can describe his problem in small composable functions.

http://www.reddit.com/r/programming/comments/1w76um/coding_in_color/cezqx25

Hey stranger :)

1. contractor-customer-scrape-data.csv contains a small sample of data which attempts to adhere to the description given:

    Situation: A contractor gives you a file that is a "comma separated" file. Let's pretend it isn't encrypted or obfuscated in any special way (even though it is, and in a way that isn't similar to any other file that you have).

    The file consists of data rows with 300 columns. Each "row" does have a newline character at the end, and there is a comma after each column (except the last as you would expect). However. Each "column" can and does contain any kind of character including newlines, commas, double quotes, single quotes, periods, semicolons, etc. Be very careful in your use of regular expressions because this file is very, very large, and if you try to be overzealous it will take about 10 years to finish.


This is a small example, but we can make it bigger after we both confirm that this data adheres to the specifications we gave. Perhaps just by duplicating it until it is "very, very large", or if you don't think that qualifies, we can write a program (composed of small functions of course) which generates valid data.

When you confirm that we've got data right, I'll start working on the implementation.

You're move, stranger!
