# Robotic-Arm-with-Image-Recognition-Enhancement

## Objectives
A remotely operated robotic controller with CNN-guided image recognition for enhanced dexterity in telesurgery.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Robotic Arm](#robotic-arm)
- [Hardware Used](#hardware-used)
- [Features](#features)
- [Code Examples](#code-examples)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
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
Furthermore, the operator also has the functionality to move the end-effector in the Z axes via the joystick. Furthermore, there is haptic feedback integrated with it, which provides an opposite force based on the pressure applied to the end-effector. This will allow the operator to have a tactile sense of remote controller haptic feedback.

3. CNN-Image Recognition for Guidance and Dexterity Enhancement
![image](https://github.com/EmperorTaha/Final-Year-Project/assets/69377374/e6643926-afdc-4fe2-889c-becb555eebd7)
Based on the image recognition and the position of the end-effector, the algorithm detects the exact organ the end-effector is looking at via the mini-camera on it. It guides the surgeon to adjust and calibrate the end-effector accordingly.




