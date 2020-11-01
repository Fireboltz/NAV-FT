# NAV-FT
___
## What does NAV-FT Solve ? :eyes:

 As per Motor Vehicle act, all commercial vehicles are mandated to undergo fitness test periodically, depending on vehicle age. 

 The vehicles are to be brought to designated fitness centers (which are normally one centre per district in most states) for inspection and certification. There are normally long queues and the process is hassle some. An innovative solution is required to ease this process for all.

Minimum Desired Outcome: **Fitness test procedure needs to be automated**. The testing is also done transparently. Wherever possible, the parameters are to be tested automatically (obtain the image / video for selected test, analyze and rate the test as pass / fail. For the tests where manual intervention is required (checking the brakes, etc.), the authorized personnel will key-in the details (online). Net results are published only if minimum set of requirements are satisfied. 
___
## Technology Stack :star:

* [Flutter](https://flutter.dev/)
* [Firebase](https://firebase.google.com/)
* [Tensorflow](https://www.tensorflow.org/)
* [Docker](https://www.docker.com/)
* [AWS SageMaker](https://aws.amazon.com/sagemaker/)
___
## Vehicle Data and data which are used from Forms

These informations are updated and documented well in the [Wiki Page](https://github.com/Fireboltz/NAV-FT/wiki)
___
## What all NAV-FT can do ? :thought_balloon:

NAV-FT contains some of the features that we can use to speed up the process of vehicle fitness testing.

**Register new Vehicle Manually:** 

The RTO officials can manually register the vehicle by filling out and interactive and easy to use form in the application which syncs the data with firebase cloud database in realtime which enables faster registration process.

 **Register new Vehicle Image:**

This feature allows the RTO officials to take the photo of the number-plate and the data will be recognized using OCR and fed into the realtime database of firebase.

**Pending Inspection List:**

This feature provides a list of all the inspection that has to be done in the order the RTO officials does according to RULE 62 of MVD and has all the forms integrated to the application which generally should be filled out by the officials in a table manner which is very difficult and time consuming.

**Completed Inspection List:**

If the Inspection of the Vehicle is already done the fitness certificate is automatically generated and stored in the firebase cloud database. This forms are listed here and can be shared by the RTO officials over the internet to or can be converted to a hardcopy.
___
## Innovations

#### Wiper Working Detection:

We have trained a model and interred using tensor-flow lite to take images from the android devices camera and predict if the fully functional or not.

#### Headlamp and Indicator Detection:

Computer vision is used in the application to predict if the headlamp and the indicator of the vehicle including the break-lights are completely in working condition and the data is automatically uploaded into the firebase cloud post-testing.


Some of the machine learning models are too heavy for the mobile phone to run locally and we need the User Experience of the app to be very smooth and hence we are have dockside the models and takes advantage of the AWS SageMaker to host the container from which we can do a simple API call to get the inference which can then be used by the Application for the automation of the tests.
___
## Screenshots

**Dashboard**

| ![1](https://user-images.githubusercontent.com/43090559/97795273-52e6e580-1c2a-11eb-9e98-b3f3e00aa000.jpeg) |
|---|---|
| The Dashboard with the Features available  |
**Features**

| ![2](https://user-images.githubusercontent.com/43090559/97795291-89246500-1c2a-11eb-8380-e05cce4e0bf2.jpeg) | ![4](https://user-images.githubusercontent.com/43090559/97795307-b5d87c80-1c2a-11eb-8a5f-8aff18342607.jpeg) |
|---|---|---|
| ![5](https://user-images.githubusercontent.com/43090559/97795315-ce489700-1c2a-11eb-8ff1-be4cbc0c1edf.jpeg) | ![7](https://user-images.githubusercontent.com/43090559/97795322-ddc7e000-1c2a-11eb-8fd3-23278cc08093.jpeg) | 

# Developers :information_desk_person:

[Abhijit Ramesh](https://github.com/abhijitramesh)

[Yash Khare](https://github.com/yashk2000)

[Vishwaak](https://github.com/Vishwaak)

[Ananthan](https://github.com/ananthanandanan)

[Mayuk](https://github.com/Mayukhdeb)
