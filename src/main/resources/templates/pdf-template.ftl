<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Booking Confirmation</title>
</head>
<body>
      <img src="${logoPath}" alt="Logo" style="width: 200px; height: auto;" />

         <h3>ELECTRONIC TICKET ITINERARY / RECEIPT</h3>
         <p><strong>PASSENGER:</strong> ${passengerName}</p>
         <p><strong>BOOKING REFERENCE:</strong> ${bookingReference}</p>
         <p><strong>TICKET NUMBER:</strong> ${ticketNumber}</p>
         <p><strong>ISSUING OFFICE:</strong> ${issuingOffice}</p>
         <p><strong>ISSUE DATE:</strong> ${issueDate}</p>

         <p>You must present this receipt along with a valid photo identification, mentioned at the time of booking, to enter the airport.
             We seek your attention to make a note of our Terms &amp; Conditions of Contract at <a href="https://www.fastays.com">Visit Fastays</a></p>
         <p>Web check-in is not permitted for Air India codeshare flight segments operated by Air Asia. Passenger has to get the check-in
             done for such flights at the Air Asia airport check-in counters.</p>

          <h3>Flight Details</h3>
              <p><strong>From:</strong> ${departureCity} (${departureAirport})</p>
              <p><strong>From Terminal:</strong> ${fromTerminal}</p>
              <p><strong>Class:</strong> ${flightClass}</p>
              <p><strong>Baggage:</strong> ${baggage}</p>
              <p><strong>Fare Basis:</strong> ${fareBasis}</p>
              <p><strong>NVB (2):</strong> ${nvbDate}</p>
              <p><strong>Flight Duration:</strong> ${flightDuration}</p>

         <p><strong>To:</strong> ${arrivalCity} (${arrivalAirport})</p>
         <p><strong>To Terminal:</strong> ${toTerminal} </p>
         <p><strong>Operated by:</strong> ${operatedBy}</p>
         <p><strong>Marketed by:</strong> ${marketedBy}</p>
         <p><strong>Booking Status (1):</strong> ${bookingStatus1}</p>
         <p><strong>NVA (3):</strong> ${nvaDate}</p>

         <h3>Flight Schedule</h3>
         <table border="1" cellspacing="0" cellpadding="5">
             <thead>
                 <tr>
                     <th>Flight</th>
                     <th>Departure</th>
                     <th>Arrival</th>
                 </tr>
             </thead>
             <tbody>
                 <tr>
                      <td>${flightNumber!"N/A"}</td>
                      <td>${departureTime!"N/A"}</td>
                      <td>${arrivalTime!"N/A"}</td>
                 </tr>
             </tbody>
         </table>

         <p>(1)OK = Confirmed (2) NVB = Not valid before (3) NVA = Not valid after</p>

         <p><strong>Payment Details</strong></p>
         <p><strong>Fare Calculation:</strong> ${fareCalculation!"N/A"}</p>
         <p><strong>Payment Form:</strong> ${paymentForm!"N/A"}</p>
         <p><strong>Endorsements:</strong> ${endorsements!"N/A"}</p>

         <h3>FARE DETAILS</h3>
         <p><strong>Base Fare:</strong> ${baseFare!"N/A"}</p>
         <p><strong>Taxes:</strong> ${taxes!"N/A"}</p>
         <p><strong>Carrier Imposed Fees:</strong> ${carrierImposedFees!"N/A"}</p>
         <p><strong>Total Amount:</strong> ${totalAmount!"N/A"}</p>
         <p><strong>Fee:</strong> ${fee!"N/A"}</p>
         <p><strong>Total OB Fees:</strong> ${totalOBFees!"N/A"}</p>
         <p><strong>Grand Total:</strong> <strong>${grandTotal!"N/A"}</strong></p>

         <p>The carriage of certain hazardous materials, like aerosols, fireworks, and flammable liquids, aboard the aircraft is forbidden.
             Further information may be obtained from <a href="https://www.fastays.com">Visit Fastays</a> or Fastays Customer Support.</p>

         <p>You are not allowed to transport dangerous goods on an aircraft. The following dangerous items are prohibited:</p>

        <img src="${prohibitedPath}" alt="Prohibited items" style="width: 700px; height: auto;" />





         <h3>IMPORTANT NOTES</h3>

         <h4><b>Data Protection Notice</b></h4>
         <p>Your personal data will be processed in accordance with the applicable carrier’s privacy policy and, where your booking is made via a reservation system provider (“GDS”), with its privacy policy.
             These are available at website <a href="http://www.iatatravelcenter.com/privacy">Privacy Policy</a></p>
         <p>or from the carrier or GDS directly. You should read this documentation, which applies to your booking and specifies, for example, how your personal data is collected, stored, used, disclosed and transferred.</p>

         <h4><b>Other Information</b></h4>
         <ul>
             <li>It is recommended for all passengers to wear masks and always maintain social distancing norms during air travel.</li>
             <li>Visit <a href="https://www.fastays.com">Visit Fastays</a> for all your travel information needs.</li>
             <li>For Fastays Contact numbers: <a href="https://www.fastays.com">Visit Fastays</a>for customer service information.</li>
             <li>For details of Dangerous Goods not permitted in Hand Baggage / Checked In Baggage - website guidelines: <a href="https://www.airindia.com/in/en/travel-information/baggage-guidelines/special-baggage.html">Baggage Guidelines</a></li>
             <li>Name in the booking reference and ticket must match exactly as in travel documents / Passport.</li>
             <li>The card used to purchase the tickets will have to be produced at the time of Check-in.</li>
             <li>If the cardholder is not the passenger, then the passenger should possess:</li>
         </ul>
         <ol>
             <li>A photocopy of both sides of the card, which will have to be self-attested by the cardholder authorizing the use of the card for the purchase of the ticket.
                 For security reasons, please strike out the Card Verification Value (CVV 3-digit security code) on the copy of your card.</li>
             <li>This photocopy should also contain the name of the passengers, and the itinerary details for which the booking is made. The above document should be produced at the time of check-in.
                 If the passenger fails to comply with these conditions, Fastays reserves the right to deny the passenger(s) from boarding.</li>
         </ol>

         <ul>
             <li>Baggage Allowances &amp; Restrictions: <a href="https://www.airindia.com/in/en/travel-information/baggage-guidelines.html">Baggage Guidelines</a></li>
             <li>Infant (not entitled to seat) baggage allowance for all Fastays Operated routes is 10kgs only.</li>
             <li>Passengers are advised to report at the check-in counters well in time. Check-in at least 02 hours before scheduled departure for Domestic flights &amp; 03 hours for International flights.</li>
         </ul>

         <table border="1">
             <tr>
                 <th><b>COUNTER CLOSING TIME</b></th>
                 <th><b>Before Departure</b></th>
             </tr>
             <tr>
                 <td>Domestic</td>
                 <td>60 Minutes</td>
             </tr>
             <tr>
                 <td>International:</td>
                 <td>60 Minutes:</td>
             </tr>
         </table>

         <h4><b>Last passenger boarded / gate closure: 20 Minutes prior departure</b></h4>
         <ul>
             <li>The Montreal Convention applies limiting the liability of checked-in registered baggage.</li>
             <li>The Carrier is not liable for any damage, if checked - in baggage includes fragile/valuable items, passports and other identification documents. Please carry same only in hand baggage.</li>
             <li>Check-in for your flights conveniently up to 48 hours in advance, to avoid queues at airport check-in counter: Mobile check-in - Download Fastays mobile app from Play Store on Android / App Store on iPhone
                 Self Services Kiosk Check-in / Baggage Drop Counters at select airports</li>
             <li>For any query, request or refund <a href="https://www.airindia.com/in/en/contact-us.html">CLICK HERE</a></li>
             <li>Please check status of your flight from website <a href="http://www.fastays.com">Visit Fastays</a> or customer support before leaving for airport.</li>
             <li>Permitted hand baggage for Economy class - 01 piece not exceeding 8 Kg.</li>
             <li>Permitted hand baggage for Premium Economy class – 01 piece not exceeding 10 Kg.</li>
             <li>Permitted hand baggage for First and Business class - 01 piece not exceeding 12 Kg.</li>
         </ul>

         <h4><b>We wish you a pleasant journey and thank you for choosing Fastays!</b></h4>

         <p>THIS ADVICE IS GENERATED BY THE FASTAYS COMPUTER SYSTEM AND DOES NOT REQUIRE A SIGNATURE. YOUR TICKET RECORD IS ELECTRONICALLY STORED WITH FASTAYS.</p>

     </body>
     </html>