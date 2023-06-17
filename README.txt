Welcome to the Earth Calendar!

This calendar honors and celebrates UNIX time as a universal standard for calendar systems. It is one implementation of a calendar that visualizes UNIX timestamp in the designs, and takes a fresh approach to how our days and years are divided up.

Notable features of the Earth calendar:
1. Year 0 is the same as UNIX timestamp - Jan 1, 1970.
2. Instead of 12 months, the year is divided into 4 quarters roughly aligning with equinoxes and solstices
3. The calendar doesn't (yet) account for local time, so the "hour" in any visualizations are UTC.

We plan to update and release the design and implementation of the Earth Calendar once a year on new year's eve.

50% of the proceeds and donations go towards the respective chain the contract is deployed on (e.g. Ethereum foundation for ethereum).

Documentation and Notes

SVG processing
- export from figma / illustrator
- add <script> element to increment UNIX timestamp every second
- replace all " with /" so that it can be used in solidity return
- remove all line breaks so that all elements are on a single line
- copy paste into .sol contract
- replace calendar data with variables in solidity

Gasless functions

Hosting and web3js example

Ethereum Notes

Polygon Notes

Solana Notes