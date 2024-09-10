<h1> 🏀 Basketball Scorekeeper 🏀</h1>
<h3>Made using Verilog in AMD Xilinix Vivado
<br/> FPGA Board: Basys 3 (Digilent)</h3>

<br/>
<b> Welcome to the repository for my first ever project!
<br/> I wanted to do a FPGA/verilog project revolving about something that interests me, so I decided to make a basketball scorekeeper!
<br/> Click
<a href="https://youtu.be/NJnX_LAqaFY">here</a>
to watch a video where I show how the board works.

<br/> The constraints and module files are available to view in this repository (testbenches NOT included).
</b>


<h2> How The Board Works </h2>
<b>
 - There are three switches, which when toggled on, dictate whether to increment the counter by 1, 2, or 3 points.
<br/> - By pressing the board's center button, the counter adds the specified number of points.
<br/> - When all switches are on, and the center button is pressed, the score is then decremented by 1.
<br/> - The top button will also reset the score to 0 when pressed (under any circumstance).
</b>

<h2> Code </h2>
<h3> Clock Dividers </h3>

![Screenshot 2024-09-10 110928](https://github.com/user-attachments/assets/3c954640-49c0-410a-b197-a8be0c4f1f88)

- The clock dividers serve to create a slower clock from the built in 100 MHz Clock
- This specific images shows a 400 Hz Clock
- The clock switches the output of the divided clock after a given amount of positive edges
- This divided clock switches from low to high/high to low after 250,000 positive clock edges from the 100 MHz clock

<h3> Debouncer Module</h3>

![Screenshot 2024-08-29 153308](https://github.com/user-attachments/assets/d6ef711d-8ba3-4678-bf1b-f8b4ed1c7f6b)


- This module consists of 3 shift registers to avoid accidental button bounces that cause input errors and mess with the scorekeeper/counter
- This module has a one clock cycle window where both the second register's Q and the third's Q_bar are both 1, which outputs high
- Having a slowed clock cycle means that the module checks the input less often and avoids any potential bounces that would be picked up

<h3> Scorekeeper Module</h3>

![Screenshot 2024-08-29 154548](https://github.com/user-attachments/assets/9acf148e-564d-4e13-ae56-4e017346b0f6)

- The scorekeeper module takes in the inputs of switches and buttons and outputs different values for ones, tens, and hundreds column
- Depending on the switches toggled, at the presss of the central button, a certain number is added to the ones column
- If the summation would cause the tens column to increase by one, then it is manually increased (as seen in this image) and the ones column is adjusted
- Reset button resets the score to 0 unconditional of the switches
- Depending on the switch configuration, either, 1, 2, or 3 points is added to the score (or 1 point is subtracted to acomodate any errors)
- Watch the video above to view the functionality 

<h3> Display Module</h3>

![Screenshot 2024-09-10 112756](https://github.com/user-attachments/assets/f8125762-67f1-4aed-82c7-de06f8de4887)

- This module takes in the decimal value from the scorekeeper module and converts it into a seven segment display representation
- The case statement follows the same structure for the tens and hundreds values (thousands omitted)

  ![Screenshot 2024-09-10 112850](https://github.com/user-attachments/assets/82c1bf2b-47c1-4d38-8e2d-58af6d243226)

- Every 100 KHz clock edge, the number displayed on the clock changes places, and depending on the number represented, the 7 segment display shows that value
- The display rapidly displays one number place at a time. This module works by making the output the necessary 7 segment display value
- In other words, when the ones place is on, the output is the ones place and whatever number should go in the ones place
- Then at the next clock cycle, the output is the tens place and the tens vlaue in 7 segment display ...


<h2> Resources </h2>
<b>
 Here are some resources that helped me complete this project: 
 <br/> - <a href="https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html">Debouncer for Button</a>
 <br/> - <a href="https://www.youtube.com/watch?v=ORhWNj8li4E">7 Segment Display</a>
</b>
