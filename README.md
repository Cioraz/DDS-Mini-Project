# Optimum room temperature regulator

## Team Details
<details>
  <summary>Details</summary>

  > Semester: 3rd Sem B. Tech. CSE

   > Section: S2
   
   > Member-1: Shubhang Walavalkar, 221CS248, shubhangnwalavalkar.221CS248@nitk.edu.in
   
   > Member-2: Sunil Thunga, 221CS252, sunilthunga.221CS252@nitk.edu.in
   
   > Member-3: Vikas Kushwaha, 221CS260, vikaskushwaha.221CS260@nitk.edu.in
</details>

# Abstract :
<details>
  <summary>Detail</summary>
  
  > Maintaining optimal room temperature is crucial for comfort and energy efficiency in hospitals. The
   problem we are trying to address involves creating an automatic room controller to enable the
   comfort of patients in the hospitals. This system that we have implemented can also be used in
   homes/offices to optimise the current and lower the overall costs by maintaining an equilibrium
   temperature for the room. Traditional thermostats have limitations in precision and control, often
   leading to discomfort. This abstract presents the design and implementation of a room temperature
   controller, a digital system that addresses this challenge.

  > The motivation behind this project stems from the need for precise temperature control.
   Conventional systems often rely on simple setpoint adjustments, resulting in temperature swings
   and unnecessary HVAC (Heating, Ventilation, and Air Conditioning) operation. Our goal is to
   create a room temperature controller that helps to control the surrounding temperature of the room
   based on the temperature of the patient to help them in a comfortable stay at the hospital. The
   main goal of this project is to implement it in hospitals to help with patients and automate the
   system to prevent external factors. In our case we have implemented this keeping in mind the
   comfort and use case in hospitals but this system can be extended to homes and offices.

   > Our room temperature controller distinguishes itself by integrating temperature control sensors.
   The temperature sensor will detect the skin body temperature of the patient and this will be passed
   as input along with the temperature of the room. Then the circuit will check patient's is comfortable
   or not by finding the difference between the optimal body temperature of the patient and current
   body temperature . If the led is turned on green then the room temperature decreases by some
   amount which is equal to the difference between patients body temperature and optimal body
   temperature. This can be used to tell for hot and cold conditions. So if skin temperature is hot thenit will instruct the fan to switch on. Now again the temperature of the patient will be taken into
   account and if the patient reaches the optimum temperature required for his comfort it stops and
   nothing will be done else again the difference between optimum temperature and the body
   temperature will be considered and accordingly the fan or heater with required speed will be turned
   on. The circuit can make use of a comparator to check for high or low . We will also be using logic
   to check for whether optimum temperature of the patient has been reached or not. Example,
   suppose the surrounding temperature is 21 and the patient is 35 then we can slowly switch on the
   heater at a low speed and check the new temperature of the patient and so on. This changes their
   skin temperature and not their core body temperature.
   In a nutshell, we are trying to bring the skin temperature of the patient to optimal body
   temperature so that the patients feels most comfortable. If patients body temp is higher we
   will try to cool it down and if its lower we will heat up to preferred body temperature without
   any human intervention. This ensures that the person feels most comfortable when in the
   hospital room where the doctors can easily cater to the other needs of the person.

   > In a general hospital system, when the patient comes to the hospital he gets redirected to the main
checkup room. At times the checkup room may be too hot or too cold to the patients liking which
may trigger him to feel uncomfortable. Our system acts as a prototype which can help in this issue.
This system works well towards how the future may take us. Assuming that in the future we would
have automated hospital checkup centers with AI, our system basically notes the body temperature
of the person as he enters into the room using a sensor.
Based on this sensor data it calculates how much the persons body temperature has deviated from
the optimum body temperature which here is assumed to be as 37*C , using this extra temperature
we accordingly modify the temperature of the room by either increasing or decreasing the room
temperature by that value to help manage the skin temperature of the person. This system would
not work based on the core body temperature of the person because when the person is having
fever we woudnt want to further decrease their temperature.
The specific temperature at which a person feels most comfortable in relation to ambient
temperature is subjective and can vary widely among individuals.The temperature at which a
person feels most comfortable in relation to ambient temperature can vary from person to person
due to factors like individual preferences, clothing, and acclimatization. However, in general, a
range of skin and ambient temperatures that are close to each other tends to be more comfortablefor most people.
A typical comfort range for indoor environments is around 67-75°F (19-24°C), where the difference
between skin temperature and ambient temperature are maintained. In this range, the body's
thermoregulatory mechanisms are not overly active, and people generally feel comfortable.
Basically person will feel comfortable If body doesn't need to work as hard to maintain its core
temperature.This happens when skin temperature and ambient temperature are in equilibrium . If a
person's skin temperature is higher, it generally indicates that their body is actively generating
more heat or is in a state of increased metabolism. In such a case, the ideal ambient temperature
for comfort may be somewhat lower. However, the relationship between skin temperature and
ambient temperature is not always straightforward, as it also depends on individual comfort
preferences and other factors. If someone's skin temperature is higher due to physical
activity or a medical condition, they might still prefer a standard comfort range for ambient
temperature, which is around 75-77°F (24-25°C) for most indoor environments. And we can
take this into account depending on the medical conditons of the patients , but currently this is out
of the scope of the mini project.
   </details>

## Working
<details>
  <summary>Detail</summary>

  > The body temperature of the patient is caluculated using sensors and the room temperature of the
   hospital is set to 21 deg celcius which is ideal ambient temperature for a healthy person at optimal
   body temperature . Optimum Body Temperature and Optimum Room Temperature may vary
   depending on the person's physical condition and envionmental factors . For simplicity and taking
   local conditions into factor we set In2 = 36*C and In3=21*C.

  > We are taking these inputs in 8bits. And we use a comparator to find if Body temperature of the
   person is higher or lower than the optimum body temp. If its greater green light is turn on to
   indicate the room temperature must be lowered and if its lesser then red light is turned on to make
   room hotter.
   This if else is implemented using MUX .
   Now if red light is on then the room temp is lowered by amount which is equal to the difference
   between patients body temp and optimum body temp and viceversa.
   Again another MUX is used for this purpose .
   The circuit is continuosly running untill the body temperature of the patient reaches optimum bodytemp and led doesnt light up. The sensor will be    continuosly recording the skin temperature and
   thus continuouly updating the room temperature according to the skin temperature of the person.


  > ![WhatsApp Image 2023-10-23 at 11 21 35 PM](https://github.com/Cioraz/DDS-Mini-Project/assets/76161837/6f9f02e7-d010-4d5a-9345-3fbe87039580)


  > ![WhatsApp Image 2023-10-23 at 11 21 49 PM](https://github.com/Cioraz/DDS-Mini-Project/assets/76161837/aa614731-9a67-4360-b33a-6f444e08c229)

</details>

## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  ![pic](https://github.com/Cioraz/DDS-Mini-Project/assets/76161837/c0310766-86d9-4ed0-ac02-d92a8a49cf64)

</details>


## Verilog Code

<details>
  <summary>Detail</summary>

  ``` 
module magComp ( In1,
   In2,
   Gt,
   In3,
   greaterval,
   tempDifference,
   finalRoom
); 

/*
In1 - Input Body Temperature
In2 - Optimum Body Temperature
In3 - Optimum Room Temperature
All are 8 bit numbers
*/
input [7:0] In1,In2,In3;

//The Outputs of comparison 
output Gt; 

// The greaterVal between In1 and In2 aswell as the finalRoom Temp
output [7:0] greaterval,finalRoom;
output [7:0] tempDifference;
reg [7:0] tempDifference;
reg lightColor;
reg [7:0] finalRoom;
reg Gt; 
reg [7:0] greaterval;

//Check the state of the input lines 
always @ (In1 or In2 or In3) 

// Depending on which is greater, return 1 or 0
begin 
 Gt <= ( In1 > In2 )? 1'b1 : 1'b0; 
end 

always @(In1, In2) begin
    tempDifference = In1>In2? In1-In2 : In2-In1;
end

// Checking the light color either red of green
always @(In1, In2) begin
    lightColor = In1>In2? 1 : 0;
end

// Based on light color to find the finalRoom temperature
always @(lightColor,tempDifference,In3) begin
    if (lightColor)
    finalRoom=In3-tempDifference;
    else
    finalRoom=In3+tempDifference;
end
endmodule
```
</details>



## Verilog Code References
> https://www.fpga4student.com/2017/06/verilog-module-in-hdl-fpga-projects.html

> http://www.asic-world.com/verilog/veritut.html

> https://www.doulos.com/knowhow/vhdl_designers_guide/assets/verilog_quickref.pdf

> https://en.wikipedia.org/wiki/Verilog

> https://www.xilinx.com/support/documentation/sw_manuals/xilinx11/books/docs/xst/xst_veri_bk_examples.htm
