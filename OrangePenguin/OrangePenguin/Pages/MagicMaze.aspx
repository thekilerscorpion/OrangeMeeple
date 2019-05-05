[;''''''';;'00o0p<%@ Page Title="MagicMaze" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MagicMaze.aspx.cs" Inherits="OrangePenguin.Pages.MazeRunner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>

        var ShowTime = 180;
        var isPaused = true;
        var audioFail = new Audio('../Files/Sound/beep-20.wav');
        audioFail.playbackRate = 4;
        var audioLow = new Audio('../Files/Sound/beep-07.wav');

        var time = setInterval(function () {

            if (isPaused === false && ShowTime != 0) {
                ShowTime--;
                if (ShowTime == 0) {
                    isPaused = true;
                    audioFail.play();
                }
                else if (ShowTime <= 30) {
                    audioLow.play();
                }
            }

            var classlist = document.getElementById('lblTimer').classList;
            if (ShowTime <= 30) {
                classlist.add("TimeLow");
            }
            else {
                classlist.remove("TimeLow");
            }



            var min = Math.floor(ShowTime / 60);
            var sec = ShowTime - (min * 60);

            if (min == 0 && sec < 30) {

            }

            document.getElementById('lblTimer').innerHTML = min + ":" + ("0" + sec).slice(-2);;

        }, 1000); //calling it every 1 second to do a count down

        function flipTime() {
            ShowTime = 180 - ShowTime;
        }

        function resetTime() {
            isPaused = true;
            ShowTime = 180;
        }

        function stopTime() {
            isPaused = true;
        }

        function startTime() {
            isPaused = false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="text-center mt-3">
        <h1><label class="Timer" id="lblTimer">3:00</label></h1>
        <br />
        <br />
        <label class="btn-lg btn-secondary" id="btnFlipTime" onclick="flipTime()">Flip Time</label>
        <br />
        <br />
        <label class="btn btn-secondary" id="btnStartTime" onclick="startTime()">Start</label>
        <br />
        <label class="btn btn-secondary" id="btnStopTime" onclick="stopTime()">Pause</label>
        <br />
        <label class="btn btn-secondary" id="btnResetTime" onclick="resetTime()">Reset Time</label>
    </div>
</asp:Content>
