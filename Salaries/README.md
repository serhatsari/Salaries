
The performance bottleneck is formatting the salary on scroll time. 
Instead of calling it at scroll time, creating a String property like salaryString and calling the formatting method in the init method can upgrade the performance of scrolling.
