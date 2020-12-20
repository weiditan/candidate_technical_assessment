# Candidate Technical Assessment

In this technical assessment, you need to build a flutter application based
on the storyline below.
#### Your application must have the following:
1. Display a list of 5 random contacts that is sorted based on the time. The time should be
displayed in the format of “time ago” like 1 minute ago or 1 hour ago. The sorting should
start from the most recent till the oldest time.
2. Users must be able to pull-to-refresh to generate another set of random contacts data
and append the latest information retrieved to the current list and sort based on
time-format.
3. The app continues to load the remaining contacts as the user scrolls down the list and
displays a message to inform the user that he/she has reached the end of the list.
4. The user can choose whether to receive notifications or otherwise by enabling or
disabling the feature with a toggle option
5. An action button that can allow the user to share the contact information to other
installed applications on the mobile.
#### Requirements:
1. Develop the APP using Flutter
2. Each completed storyline is a plus.
3. Track progress of the project via Git version control system.
4. List down all the plugins that you used to build the app.
    1. pull_to_refresh: ^1.6.3
    1. permission_handler: ^5.0.1+1
    1. share: ^0.6.5+4
    1. app_settings: ^4.0.4

Time to complete = <b>1 week</b>

## Contacts Dataset Example
````
{
"user": "Chan Saw Lin"
"phone": "0152131113"
"check-in": 2020-06-30 16:10:05
},
{
"user": "Lee Saw Loy"
"phone": "0161231346"
"check-in": 2020-07-11 15:39:59
},
{
"user": "Khaw Tong Lin"
"phone": "0158398109"
"check-in": 2020-08-19 11:10:18
},
{
"user": "Lim Kok Lin"
"phone": "0168279101"
"check-in": 2020-08-19 11:11:35
},
{
"user": "Low Jun Wei"
"phone": "0112731912"
"check-in": 2020-08-15 13:00:05
},
{
"user": "Yong Weng Kai"
"phone": "0172332743"
"check-in": 2020-07-31 18:10:11
},
{
"user": "Jayden Lee"
"phone": "0191236439"
"check-in": 2020-08-22 08:10:38
},
{
"user": "Kong Kah Yan"
"phone": "0111931233"
"check-in": 2020-07-11 12:00:00
},
{
"user": "Jasmine Lau"
"phone": "0162879190"
"check-in": 2020-08-01 12:10:05
},
{
"user": "Chan Saw Lin"
"phone": "016783239"
"check-in": 2020-08-23 11:59:05
}
````