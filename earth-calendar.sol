// SPDX-License-Identifier: Unlicense

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract earthCalendar {

    // DONATE

    address public owner;
    constructor(){
        owner = msg.sender; // paste my address
    }


    // UTILITIES

    function getDateTime() public view returns(uint[6] memory) {
        // init
        uint t = block.timestamp;
        uint secondsPerQuarter = 7884000; // 91.25 days in a quarter (accounts for leap year)
        uint secondsPerDay =  86400;
        uint secondsPerHour = 3600;
        // year
        uint y = uint256(block.timestamp / 31536000); // number of seconds in a non-leap year
        // quarter and day of quarter
        uint secondsCurrentQuarter = t % secondsPerQuarter; 
        uint q = ((t / secondsPerQuarter) % 4) + 1;
        uint d1 = secondsCurrentQuarter / secondsPerDay + 1;
        // day of week
        uint d2 = (block.timestamp / secondsPerDay + 4) % 7;
        // hour
        uint h = (block.timestamp / secondsPerHour) % 24;
        // Return date times [UNIX time, year, quarter, day of quarter, day of week, hour of day]
        return [t,y,q,d1,d2,h];
    }

    function getDayString(uint dayInt) pure public returns(string memory) {
        string[7] memory daysOfWeek = ["S", "M", "T", "W", "Th", "F", "Sa"];
        string memory dayString = daysOfWeek[dayInt];
        return dayString;
    }

    function getDigitY(uint number, uint position) public pure returns (uint) {
        uint divisor = 10 ** (position - 1);
        uint digit = (number / divisor) % 10;
        return ((9-digit)*5)+25; // convert to Y position for SVG
    }

    // VIEWS

    function calendar() public view returns(string memory) {    
        // get date time
        uint[6] memory d = getDateTime();
        string memory dayOfWeek = getDayString(d[4]);
        // return SVG
        return string.concat("<svg width=\"390\" height=\"160\" viewBox=\"0 0 390 150\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><circle cx=\"60\" cy=\"75\" r=\"52\" fill=\"#FEFEFE\" stroke=\"#D6D6D6\"/><circle cx=\"240\" cy=\"75\" r=\"52\" fill=\"#FEFEFE\" stroke=\"#D6D6D6\"/><circle cx=\"330\" cy=\"75\" r=\"52\" fill=\"#FEFEFE\" stroke=\"#D6D6D6\"/><circle cx=\"150\" cy=\"75\" r=\"52\" fill=\"#FEFEFE\" stroke=\"#D6D6D6\"/><text fill=\"#9E9E9E\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"15.3%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">Q",Strings.toString(d[2]),"</tspan></text><text fill=\"#9E9E9E\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"38.4%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[3]),"</tspan></text><text fill=\"#9E9E9E\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"61.6%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",dayOfWeek,"</tspan></text><text fill=\"#9E9E9E\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"85%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[5]),"</tspan></text><text fill=\"#808080\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"18\" letter-spacing=\"0em\"><tspan x=\"50%\" y=\"10%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[1]),"</tspan></text><text fill=\"#E8E8E8\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"18\" letter-spacing=\"0em\"><tspan id=\"UNIX\" x=\"50%\" y=\"100%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[0]),"</tspan></text><script>function increment() {var text = document.getElementById(\"UNIX\");text.innerHTML = ++text.innerHTML;}setInterval(increment, 1000);</script></svg>");
    }

    function calendarDark() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        string memory dayOfWeek = getDayString(d[4]);
        // return SVG
        return string.concat("<svg width=\"390\" height=\"160\" viewBox=\"0 0 390 150\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><circle cx=\"60\" cy=\"75\" r=\"52\" fill=\"#1D1D1D\" stroke=\"#414141\"/><circle cx=\"240\" cy=\"75\" r=\"52\" fill=\"#1D1D1D\" stroke=\"#414141\"/><circle cx=\"330\" cy=\"75\" r=\"52\" fill=\"#1D1D1D\" stroke=\"#414141\"/><circle cx=\"150\" cy=\"75\" r=\"52\" fill=\"#1D1D1D\" stroke=\"#414141\"/><text fill=\"#CACACA\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"15.3%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">Q",Strings.toString(d[2]),"</tspan></text><text fill=\"#CACACA\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"38.4%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[3]),"</tspan></text><text fill=\"#CACACA\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"61.6%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",dayOfWeek,"</tspan></text><text fill=\"#CACACA\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"28\" letter-spacing=\"0em\"><tspan x=\"85%\" y=\"52%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[5]),"</tspan></text><text fill=\"#EDEDED\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"18\" letter-spacing=\"0em\"><tspan x=\"50%\" y=\"10%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[1]),"</tspan></text><text fill=\"#383838\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" font-size=\"18\" letter-spacing=\"0em\"><tspan id=\"UNIX\" x=\"50%\" y=\"100%\" dominant-baseline=\"middle\" text-anchor=\"middle\">",Strings.toString(d[0]),"</tspan></text><script>function increment() {var text = document.getElementById(\"UNIX\");text.innerHTML = ++text.innerHTML;}setInterval(increment, 1000);</script></svg>");
    }

    function calendarSmall() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        string memory dayOfWeek = getDayString(d[4]);
        return string.concat("<svg width=\"250\" height=\"36\" viewBox=\"0 0 250 36\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><text x=\"0%\" y=\"50%\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" letter-spacing=\"0em\"><tspan fill=\"#9E9E9E\" font-size=\"21\" dominant-baseline=\"middle\" text-anchor=\"left\">",Strings.toString(d[1]),"&#160;&#160;Q",Strings.toString(d[2]),"&#160;&#160;",Strings.toString(d[3]),"&#160;&#160;",dayOfWeek,"&#160;&#160;</tspan><tspan fill=\"#E8E8E8\" font-size=\"12\" dominant-baseline=\"middle\" text-anchor=\"left\" id=\"UNIX\">",Strings.toString(d[0]),"</tspan></text><script>function increment() {var text = document.getElementById(\"UNIX\");text.innerHTML = ++text.innerHTML;}setInterval(increment, 1000);</script></svg>");
    }

    function calendarSmallDark() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        string memory dayOfWeek = getDayString(d[4]);
        return string.concat("<svg width=\"250\" height=\"36\" viewBox=\"0 0 250 36\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><text x=\"0%\" y=\"50%\" xml:space=\"preserve\" style=\"white-space: pre\" font-family=\"Arial\" letter-spacing=\"0em\"><tspan fill=\"#CACACA\" font-size=\"21\" dominant-baseline=\"middle\" text-anchor=\"left\">",Strings.toString(d[1]),"&#160;&#160;Q",Strings.toString(d[2]),"&#160;&#160;",Strings.toString(d[3]),"&#160;&#160;",dayOfWeek,"&#160;&#160;</tspan><tspan fill=\"#383838\" font-size=\"12\" dominant-baseline=\"middle\" text-anchor=\"left\" id=\"UNIX\">",Strings.toString(d[0]),"</tspan></text><script>function increment() {var text = document.getElementById(\"UNIX\");text.innerHTML = ++text.innerHTML;}setInterval(increment, 1000);</script></svg>");
    }

    function calendarGraphic() public view returns(string memory) {
        // get UNIX time
        uint t = block.timestamp;
        return string.concat("<svg width=\"410\" height=\"95\" viewBox=\"0 0 410 95\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><circle id=\"C1\" cx=\"25\"  cy=\"",Strings.toString(getDigitY(t,10)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C2\" cx=\"65\"  cy=\"",Strings.toString(getDigitY(t,9)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C3\" cx=\"105\" cy=\"",Strings.toString(getDigitY(t,8)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C4\" cx=\"145\" cy=\"",Strings.toString(getDigitY(t,7)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C5\" cx=\"185\" cy=\"",Strings.toString(getDigitY(t,6)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C6\" cx=\"225\" cy=\"",Strings.toString(getDigitY(t,5)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C7\" cx=\"265\" cy=\"",Strings.toString(getDigitY(t,4)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C8\" cx=\"305\" cy=\"",Strings.toString(getDigitY(t,3)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C9\" cx=\"345\" cy=\"",Strings.toString(getDigitY(t,2)),"\" r=\"20\" stroke=\"#D6D6D6\"/><circle id=\"C10\" cx=\"385\" cy=\"70\" r=\"20\" stroke=\"#D6D6D6\"/><script>setInterval(function() {var c10 = document.getElementById(\"C10\");var c10y = parseInt(c10.getAttribute(\"cy\")) - 5;if (c10y &lt; 25) {c10y = 70;var c9 = document.getElementById(\"C9\");var c9y = parseInt(c9.getAttribute(\"cy\")) - 5;if (c9y &lt; 25) {c9y = 70;var c8 = document.getElementById(\"C8\");var c8y = parseInt(c8.getAttribute(\"cy\")) - 5;if (c8y &lt; 25) {c8y = 70;}c8.setAttribute(\"cy\", c8y.toString());}c9.setAttribute(\"cy\", c9y.toString());}c10.setAttribute(\"cy\", c10y.toString());}, 1000);</script></svg>");
    }

    function calendarGraphicDark() public view returns(string memory) {
        uint t = block.timestamp;
        return string.concat("<svg width=\"410\" height=\"95\" viewBox=\"0 0 410 95\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><circle id=\"C1\" cx=\"25\"  cy=\"",Strings.toString(getDigitY(t,10)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C2\" cx=\"65\"  cy=\"",Strings.toString(getDigitY(t,9)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C3\" cx=\"105\" cy=\"",Strings.toString(getDigitY(t,8)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C4\" cx=\"145\" cy=\"",Strings.toString(getDigitY(t,7)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C5\" cx=\"185\" cy=\"",Strings.toString(getDigitY(t,6)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C6\" cx=\"225\" cy=\"",Strings.toString(getDigitY(t,5)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C7\" cx=\"265\" cy=\"",Strings.toString(getDigitY(t,4)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C8\" cx=\"305\" cy=\"",Strings.toString(getDigitY(t,3)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C9\" cx=\"345\" cy=\"",Strings.toString(getDigitY(t,2)),"\" r=\"20\" stroke=\"#808080\"/><circle id=\"C10\" cx=\"385\" cy=\"70\" r=\"20\" stroke=\"#808080\"/><script>setInterval(function() {var c10 = document.getElementById(\"C10\");var c10y = parseInt(c10.getAttribute(\"cy\")) - 5;if (c10y &lt; 25) {c10y = 70;var c9 = document.getElementById(\"C9\");var c9y = parseInt(c9.getAttribute(\"cy\")) - 5;if (c9y &lt; 25) {c9y = 70;var c8 = document.getElementById(\"C8\");var c8y = parseInt(c8.getAttribute(\"cy\")) - 5;if (c8y &lt; 25) {c8y = 70;}c8.setAttribute(\"cy\", c8y.toString());}c9.setAttribute(\"cy\", c9y.toString());}c10.setAttribute(\"cy\", c10y.toString());}, 1000);</script></svg>");
    }

}