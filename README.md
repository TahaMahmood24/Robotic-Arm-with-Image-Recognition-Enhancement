# Robotic-Arm-with-Image-Recognition-Enhancement

## Objectives
A remotely operated robotic controller with CNN-guided image recognition for enhanced dexterity in telesurgery.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Robotic Arm](#robotic-arm)
- [Hardware Used](#hardware-used)
- [Functionality](#functionality)
- [Contributing](#contributing)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

## Features
- Remote robotic control
- Real-time image recognition for precise manipulation
- Enhanced surgical dexterity through intuitive GUI controls

## Technologies Used

- Robotic hardware components
- Convolutional Neural Networks (CNN)
- Image recognition algorithms
- Serial Communication Protocol

## Robotic Arm
In this project, we used the <b>PUMA 560</b> robotic manipulator. PUMA 560 was used in 1985 in a stereotaxic operation, in which computed tomography was used to guide the robot as it inserted a needle into the brain for biopsy, a procedure previously subject to error from hand tremors during needle placement.

## Hardware Used
- Arduino Mega
- Personal Computer with MATLAB Installed

## Functionality

In this project, the operators control the robotic arm via a Graphic User Interface and Haptic Joystick
  1. Graphic User Interface

- In this project, the operator can use the GUI to control the haptic arm on the X-Y-Z axes.
 ![image](https://github.com/EmperorTaha/Final-Year-Project/assets/69377374/47e17200-5cd9-49c2-906a-58417cb10414)
Here, the operator selects the distance that they want to move the end-effector and then clicks on the relevant direction they want to move to.

  2. Haptic Feedback Joystick
 
In order to control the movement of the end-effector along the Z-axis, the operator has the option to utilize the joystick. Additionally, the device is equipped with haptic feedback which offers a counterforce that is based on the applied pressure, providing the user with remote tactile feedback. This feature aims to enhance the overall user experience and ensure precision and accuracy in the operation of the device.

  3. CNN-Image Recognition for Guidance and Dexterity Enhancement
     
![image](https://github.com/EmperorTaha/Final-Year-Project/assets/69377374/2a2a8e9c-876d-4764-8142-b0ef9a3349e4)
The advanced algorithm utilized in this surgical system incorporates image recognition technology and a mini-camera integrated into the end-effector. This feature enables the accurate identification of the specific organ being observed, facilitating precise adjustments. Additionally, the algorithm is equipped to detect the area of interest (red rectangle) and the end-effector (green crosshair), thereby increasing the operator's efficiency and enhancing the system's overall dexterity. The integration of these advanced features assures a high level of precision and accuracy in surgical procedures, providing a favourable outcome for patients.

## License
For any questions or collaborations, please email us at taha.mahmood.73@gmail.com

## Acknowledgements

I would like to express my sincere gratitude to [Dr. Abid Imran]([link-to-profile](https://giki.edu.pk/personnel/dr-abid-imran/)) for his invaluable guidance and contributions to this project. His expertise in robotics and surgical technology has been instrumental in shaping the direction of this work.

Dr. Imran's insightful feedback and mentorship have greatly enriched the development of the haptic robotic device and its integration with CNN-guided image recognition. His dedication to advancing the field of telesurgery has inspired us to push the boundaries of innovation in medical robotics.

I am thankful for the opportunity to collaborate with Dr. Imran and benefit from his expertise, and I look forward to continuing to learn and grow under his mentorship.







