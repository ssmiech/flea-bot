require 'rest-client'
require 'json'



class TestController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  @token = "FILL_ME_IN"
  @slack_token = 'FILL_ME_IN'
  @slack_channel = 'FILL_ME_IN'


  def index
    survey_id = 36

    surveys = JSON.parse(RestClient.get("https://staging.helloflea.com/api/v1/surveys", {
      :Authorization => `Bearer #{@token}`
    }))

    surveys.each do |survey|
      Survey.find_by(id: survey["id"])&.destroy
      Survey.new(
        id: survey["id"],
        state: survey["status"],
        start_date: survey["start_date"],
        end_date: survey["end_date"]
      ).save
    end

    ongoing_surveys = Survey.where(state: "collection_ongoing")

    print ongoing_surveys
    response = JSON.parse(RestClient.get("https://staging.helloflea.com/api/v1/surveys/36", {
      :Authorization => `Bearer #{@token}`
    }))

    slackApi = Slack::Web::Client.new(token: @slack_token)

    slackApi.chat_postMessage(channel: @slack_channel, blocks: [
      {
        "type": "header",
        "text": {
          "type": "plain_text",
          "text": "A. People topics"
        }
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "*Engagement & Satisfaction*"
        }
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "1. Job enthusiasm"
        },
        "accessory": {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "Needs improvement now",
            "emoji": true
          },
          "value": "click_me_123",
          "action_id": "button-action"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Good",
              "emoji": true
            },
            "value": "click_me_0",
            "action_id": "actionId-0",
            "style": "primary"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "So-So",
              "emoji": true
            },
            "value": "click_me_1",
            "action_id": "actionId-1"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Bad",
              "emoji": true
            },
            "value": "click_me_2",
            "action_id": "actionId-2"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "N/A",
              "emoji": true
            },
            "value": "click_me_3",
            "action_id": "actionId-3"
          }
        ]
      },
      {
        "type": "divider"
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "2. Ability to be productive"
        },
        "accessory": {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "Needs improvement now",
            "emoji": true
          },
          "value": "click_me_c",
          "action_id": "button-action"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Good",
              "emoji": true
            },
            "value": "click_me_0",
            "action_id": "actionId-0"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "So-So",
              "emoji": true
            },
            "value": "click_me_1",
            "action_id": "actionId-1",
            "style": "primary"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Bad",
              "emoji": true
            },
            "value": "click_me_2",
            "action_id": "actionId-2"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "N/A",
              "emoji": true
            },
            "value": "click_me_3",
            "action_id": "actionId-3"
          }
        ]
      },
      {
        "type": "divider"
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "3. Comfort in experimenting and risk-taking"
        },
        "accessory": {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "Needs improvement now",
            "emoji": true
          },
          "value": "click_me_123",
          "action_id": "button-action"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Good",
              "emoji": true
            },
            "value": "click_me_0",
            "action_id": "actionId-0"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "So-So",
              "emoji": true
            },
            "value": "click_me_1",
            "action_id": "actionId-1"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Bad",
              "emoji": true
            },
            "value": "click_me_2",
            "action_id": "actionId-2",
            "style": "primary"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "N/A",
              "emoji": true
            },
            "value": "click_me_3",
            "action_id": "actionId-3"
          }
        ]
      },
      {
        "type": "divider"
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "4. Feeling that work has meaningful purpose"
        },
        "accessory": {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "Needs improvement now",
            "emoji": true
          },
          "value": "click_me_123",
          "action_id": "button-action"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Good",
              "emoji": true
            },
            "value": "click_me_0",
            "action_id": "actionId-0"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "So-So",
              "emoji": true
            },
            "value": "click_me_1",
            "action_id": "actionId-1",
            "style": "primary"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Bad",
              "emoji": true
            },
            "value": "click_me_2",
            "action_id": "actionId-2"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "N/A",
              "emoji": true
            },
            "value": "click_me_3",
            "action_id": "actionId-3"
          }
        ]
      },
      {
        "type": "divider"
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "5. Satisfaction with work-life-balance"
        },
        "accessory": {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "Needs improvement now",
            "emoji": true
          },
          "value": "click_me_123",
          "action_id": "button-action"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Good",
              "emoji": true
            },
            "value": "click_me_0",
            "action_id": "actionId-0"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "So-So",
              "emoji": true
            },
            "value": "click_me_1",
            "action_id": "actionId-1"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Bad",
              "emoji": true
            },
            "value": "click_me_2",
            "action_id": "actionId-2"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "N/A",
              "emoji": true
            },
            "value": "click_me_3",
            "action_id": "actionId-3"
          }
        ]
      },
      {
        "type": "divider"
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Continue",
              "emoji": true
            },
            "value": "click_me_123",
            "action_id": "actionId-0",
            "style": "primary"
          }
        ]
      }
    ])

    render json: {
      survey_ids: ongoing_surveys.map { |survey| survey.id },
      response_id: response["id"],
      status: response["status"],
      participants: response["participants"],
      questions: response["questions"]
    }
  end

  def interactions
    payload = JSON.parse(params["payload"])
    user = payload["user"]
    print "Hello\n"
    print user
    print payload

    console

    render json: {}
  end
end

class Hell
  def foo
    "bar"
  end
end
