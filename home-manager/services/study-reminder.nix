{ config, pkgs, lib, ... }:

{
  # Install the script
  home.file.".local/bin/study-reminder.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      questions=(
        "Are we proud of what we did today?"
        "Did we learn something new today?"
        "Is it time to study yet?"
        "What did we learn today?"
        "Did we make progress toward our goals today?"
        "What was the most important thing we did today?"
        "Did we waste time on anything unnecessary?"
        "What could we have done better today?"
        "Did we step out of our comfort zone?"
        "Did we help someone today?"
        "Did we stay focused on our priorities?"
        "What distracted us the most today?"
        "Did we take care of our health today?"
        "Did we exercise or move our body?"
        "Did we eat well today?"
        "Did we manage our time effectively?"
        "Did we finish what we started?"
        "What are we grateful for today?"
        "Did we challenge ourselves intellectually?"
        "Did we practice discipline today?"
        "Did we procrastinate on anything?"
        "What motivated us today?"
        "What drained our energy today?"
        "Did we improve any skill today?"
        "What is one thing we can improve tomorrow?"
        "Did we stay consistent with our habits?"
        "Did we avoid negative influences?"
        "Did we reflect on our actions?"
        "Did we make any mistakes worth learning from?"
        "What inspired us today?"
        "Did we stay organized?"
        "Did we plan ahead for tomorrow?"
        "What did we enjoy the most today?"
        "Did we stay true to our values?"
        "Did we communicate effectively?"
        "Did we take breaks when needed?"
        "Did we manage stress well?"
        "Did we stay patient and calm?"
        "Did we do something creative?"
        "Did we learn from someone else today?"
        "Did we push through difficulties?"
        "What is one small win from today?"
        "What would make tomorrow better?"
        "Did we stay accountable?"
        "Did we follow through on commitments?"
        "Did we make smart decisions today?"
        "Did we stay positive?"
        "Did we invest in our future?"
        "Did we use our time wisely?"
        "Did we end the day better than we started?"
      )

      while true; do
        random_question="''${questions[RANDOM % ''${#questions[@]}]}"
        ${pkgs.libnotify}/bin/notify-send "$random_question" -a "study-reminder"

        if [ -e "/home/timothy/.local/share/anubhav/mixkit-attention-bell-ding-586.wav" ]; then 
          mpv --no-video "/home/timothy/.local/share/anubhav/mixkit-attention-bell-ding-586.wav"
        else
          ${pkgs.libnotify}/bin/notify-send "audio file not found"
        fi

        sleep $((3200 * 3 + RANDOM % 1800))
      done
    '';
  };

  # Systemd user service
  systemd.user.services.study-reminder = {
    Unit = {
      Description = "Study Reminder Notifications";
    };

    Service = {
      ExecStart = "%h/.local/bin/study-reminder.sh";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
