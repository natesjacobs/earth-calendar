// SPDX-License-Identifier: Unlicense

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract earthCalendar {

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

        return [t,y,q,d1,d2,h];
    }

    function getDayString(uint dayInt) pure public returns(string memory) {
        string[7] memory daysOfWeek = ["S", "M", "T", "W", "Th", "F", "Sa"];
        string memory dayString = daysOfWeek[dayInt];
        return dayString;
    }

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
        return string.concat("");
    }

    function calendarSmallDark() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        string memory dayOfWeek = getDayString(d[4]);
        return string.concat("");
    }

    function calendarGraphic() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        return string.concat("");
    }

    function calendarGraphicDark() public view returns(string memory) {
        // get date time
        uint[6] memory d = getDateTime();
        return string.concat("");
    }

}