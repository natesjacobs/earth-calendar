pragma solidity ^0.8.0;



// Test return of SVG

function calendarView() public view pure returns (string) {

  return "<svg width="429" height="162" viewBox="0 0 429 162" fill="none" xmlns="http://www.w3.org/2000/svg">
  <circle cx="83.5" cy="73.5" r="52" fill="#1D1D1D" stroke="#414141"/>
  <circle cx="257.5" cy="73.5" r="52" fill="#1D1D1D" stroke="#414141"/>
  <circle cx="344.5" cy="73.5" r="52" fill="#1D1D1D" stroke="#414141"/>
  <text fill="#CACACA" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="30" letter-spacing="0em"><tspan x="63.4756" y="83.4004">Q2</tspan></text>
  <path d="M223.5 73.5C223.5 102.214 199.999 125.5 171 125.5C142.001 125.5 118.5 102.214 118.5 73.5C118.5 44.7857 142.001 21.5 171 21.5C199.999 21.5 223.5 44.7857 223.5 73.5Z" fill="#1D1D1D" stroke="#414141"/>
  <text fill="#CACACA" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="30" letter-spacing="0em"><tspan x="145.951" y="83.4004">135</tspan></text>
  <text fill="#CACACA" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="30" letter-spacing="0em"><tspan x="245.005" y="83.4004">M</tspan></text>
  <text fill="#CACACA" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="30" letter-spacing="0em"><tspan x="328.301" y="83.4004">18</tspan></text>
  <text fill="#EDEDED" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="18" letter-spacing="0em"><tspan x="204.48" y="24.2402">53</tspan></text>
  <text fill="#383838" xml:space="preserve" style="white-space: pre" font-family="Arial" font-size="18" letter-spacing="0em"><tspan id="UNIX" x="164.402" y="150.24">1684270622</tspan></text>
  <script>
    function increment() {
      var text = document.getElementById("UNIX");
      text.innerHTML = ++text.innerHTML;
    }
    setInterval(increment, 1000);
  </script>
  </svg>"

}





// NOTES (DELETE AFTER FINAL SCRIPT DONE)

// From chatGPT

HOUR
function getCurrentHour() public view pure returns (uint256) {
        uint256 currentHour = (block.timestamp / 3600) % 24;
        return currentHour;
    }

DAY (WEEK)
function getCurrentDayOfWeek() public view pure returns (string memory) {
        uint256 currentDayOfWeek = (block.timestamp / 86400 + 4) % 7;
        string[7] memory daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        return daysOfWeek[currentDayOfWeek];
    }

DAY (QUARTER)
function getCurrentQuarterAndDay() public view pure returns (uint256 quarter, uint256 day) {
        uint256 secondsPerQuarter = 7884000; // 91.25 days in a quarter
        uint256 elapsedSeconds = block.timestamp % secondsPerQuarter;
        quarter = (uint256((block.timestamp / secondsPerQuarter) * 4) + 2) / 8 + 1;
        day = elapsedSeconds / 86400 + 1;
        return (quarter, day);
    }


QUARTER
function getCurrentQuarter() public view pure returns (uint256) {
        uint256 currentQuarter = (uint256((block.timestamp / 31536000) * 4) + 2) / 8 + 1;
        return currentQuarter;
    }
(explanation)
get the current UNIX timestamp and then divides it by the number
of seconds in a non-leap year (31536000). This gives the number
of years that have elapsed since the UNIX epoch. The number of
years elapsed is then multiplied by 4, since there are four
quarters in a year. The value 2 is added to this product to
adjust the calculation for the midpoint of each quarter. The
result is then divided by 8 and rounded up, which maps the
calculated value to a value between 1 and 4, representing the
current quarter of the year.

YEAR
function getCurrentYear public pure returns (uint256) {
        uint256 currentYear = uint256(block.timestamp / 31536000) // number of seconds in a non-leap year
        return currentYear;
    }
