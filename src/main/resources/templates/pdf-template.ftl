<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Booking Confirmation</title>
</head>
<body>
     <img src="C:\POC\Fastays logo.jpg" alt="Logo" style="width: 200px; height: auto;" />

         <h1>ELECTRONIC TICKET ITINERARY / RECEIPT</h1>
         <p><strong>PASSENGER:</strong> ${passengerName}</p>
         <p><strong>BOOKING REFERENCE:</strong> ${bookingReference}</p>
         <p><strong>TICKET NUMBER:</strong> ${ticketNumber}</p>
         <p><strong>ISSUING OFFICE:</strong> ${issuingOffice}</p>
         <p><strong>ISSUE DATE:</strong> ${issueDate}</p>

         <h3>ELECTRONIC TICKET ITINERARY / RECEIPT</h3>
         <p>You must present this receipt along with a valid photo identification, mentioned at the time of booking, to enter the airport.
             We seek your attention to make a note of our Terms &amp; Conditions of Contract at <a href="https://www.fastays.com">Visit Fastays</a>
             Web check-in is not permitted for Air India codeshare flight segments operated by Air Asia. Passenger has to get the check-in
             done for such flights at the Air Asia airport check-in counters.</p>

         <h2>Flight Details</h2>
         <p><strong>From:</strong> ${departureCity!""} (${departureAirport!"N/A"})</p>
         <p><strong>Terminal:</strong> ${terminal!"N/A"}</p>
         <p><strong>Class:</strong> ${flightClass}</p>
         <p><strong>Baggage:</strong> ${baggage}</p>
         <p><strong>Fare Basis:</strong> ${fareBasis}</p>
         <p><strong>NVB (2):</strong> ${nvbDate!"N/A"}</p>
         <p><strong>Flight Duration:</strong> ${flightDuration!"Not Specified"}</p>

         <p><strong>To:</strong> ${arrivalCity} (${arrivalAirport})</p>
         <p><strong>Terminal:</strong> ${terminal} </p>
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
                     <td>${arrivalTime!"N/A"}</td>
                     <td>${departureDate!"N/A"}</td>
                     <td>${arrivalDate!"N/A"}</td>
                 </tr>
             </tbody>
         </table>

         <p>(1)OK = Confirmed (2) NVB = Not valid before (3) NVA = Not valid after</p>

         <p><strong>Payment Details</strong></p>
         <p><strong>Fare Calculation:</strong> ${fareCalculation!"N/A"}</p>
         <p><strong>Form of Payment:</strong> ${paymentForm!"N/A"}</p>
         <p><strong>Endorsements:</strong> ${endorsements!"N/A"}</p>

         <h3>FARE DETAILS</h3>
         <p><strong>Base Fare:</strong> ${baseFare!"N/A"}</p>
         <p><strong>Taxes:</strong> ${taxes!"N/A"}</p>
         <p><strong>Carrier Imposed Fees:</strong> ${carrierFees!"N/A"}</p>
         <p><strong>Total Amount:</strong> ${totalAmount!"N/A"}</p>
         <p><strong>Fee:</strong> ${fee!"N/A"}</p>
         <p><strong>Total OB Fees:</strong> ${totalOBFees!"N/A"}</p>
         <p><strong>Grand Total:</strong> <strong>${grandTotal!"N/A"}</strong></p>

         <p>The carriage of certain hazardous materials, like aerosols, fireworks, and flammable liquids, aboard the aircraft is forbidden.
             Further information may be obtained from <a href="https://www.fastays.com">Visit Fastays</a> or Air India Customer Support.</p>

         <p>You are not allowed to transport dangerous goods on an aircraft. The following dangerous items are prohibited:</p>

         <a href="C:\POC\flight\Prohibited icons.jpg">Prohibited icons</a>

         <h3>IMPORTANT NOTES</h3>

         <h4><b>Data Protection Notice</b></h4>
         <p>Your personal data will be processed in accordance with the applicable carrier’s privacy policy and, where your booking is made via a reservation system provider (“GDS”), with its privacy policy.
             These are available at website <a href="http://www.iatatravelcenter.com/privacy">Privacy Policy</a>
             or from the carrier or GDS directly. You should read this documentation, which applies to your booking and specifies, for example, how your personal data is collected, stored, used, disclosed and transferred.</p>

         <h4><b>Other Information</b></h4>
         <ul>
             <li>It is recommended for all passengers to wear masks and always maintain social distancing norms during air travel.</li>
             <li>Visit <a href="https://www.fastays.com">Visit Fastays</a> for all your travel information needs.</li>
             <li>For Air India Contact numbers: <a href="https://www.fastays.com/in/en/customer-support.html">www.fastays.com</a></li>
             <li>For details of Dangerous Goods not permitted in Hand Baggage / Checked In Baggage - website guidelines: <a href="https://www.airindia.com/in/en/travel-information/baggage-guidelines/special-baggage.html">Baggage Guidelines</a></li>
             <li>Name in the booking reference and ticket must match exactly as in travel documents / Passport. The card used to purchase the tickets will have to be produced at the time of Check-in.</li>
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
             <li>Infant (not entitled to seat) baggage allowance for all Air India Operated routes is 10kgs only.</li>
             <li>Passengers are advised to report at the check-in counters well in time. Check-in at least 02 hours before scheduled departure for Domestic flights &amp; 03 hours for International flights.</li>
         </ul>

         <table border="1">
             <tr>
                 <th><b>COUNTER CLOSING TIME</b></th>
                 <th><b>DOMESTIC FLIGHTS</b></th>
                 <th><b>INTERNATIONAL FLIGHTS</b></th>
             </tr>
             <tr>
                 <td><b>Check-in</b></td>
                 <td>45 Minutes</td>
                 <td>60 Minutes</td>
             </tr>
             <tr>
                 <td><b>Boarding</b></td>
                 <td>30 Minutes</td>
                 <td>45 Minutes</td>
             </tr>
         </table>

         <p>NOTE: In case of any discrepancy in the name, a maximum of 3 characters will be allowed as a difference. For example, if your name is “Anil Sharma”, then you can travel with the name “Anil Sharma” or “Anil S” but not “S Anil” or “A Sharma”.</p>

         <p>Air India has the right to cancel any booking with a refund of the ticket value only. Any non-recoverable taxes will be deducted as applicable.</p>
         <p>Thank you for choosing Fastays. We wish you a pleasant journey.</p>
     </body>
     </html>