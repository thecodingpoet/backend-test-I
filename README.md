## Back-end Developer Test

### Devcenter Backend Developer Test I

The purpose of this test is not only to quickly gauge an applicant's abilities with writing codes, but also their approach to development.

Applicants may use whatever language they want to achieve the outcome.

## Task

Build a bot that extracts the following from people’s Twitter bio (on public/open accounts), into a Google spreadsheet:

* Twitter profile name 
* Number of followers

Target accounts using either of these criteria:
* Based on hashtags used
* Based on number of followers; Between 1,000 - 50,000

The bot is suppose to maintain a session and continously listen to the predefined hashtag

## Development language
Ruby 2.4.0

## Getting started
- You need to set up the following to run the application successfully

## Twitter Setup
- Go to https://apps.twitter.com, click on Create New App Button
- Fill out the form correctly, click Create your Twitter Application
- Replace the consumer key, consumer secret, access token and access token secret values with the ones you generate.

## Google Spreadsheet Setup
- Go to Google API console https://console.cloud.google.com/apis/
- Create a new project
- Click Enable API. Search for and enable the Google Drive API.
- Create credentials for a service account to access Application data.
- Obtain OAuth2 credentials from Google Developers Console for google spreadsheet api and drive api
- Save the file as google_sheets.json in same directory as project.

## Run the App
- Install dependencies bundle install
- To run the app: ruby bot.rb


## Live Demo
Here is a link to the demo of the app - https://www.youtube.com/watch?v=RRcidPDHjcQ&feature=youtu.be