package com.example.flight.service;

import com.example.flight.dto.FlightNotificationDto;
import com.lowagie.text.DocumentException;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.xhtmlrenderer.pdf.ITextRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

@Service
public class FlightNotificationService {

    @Autowired
    private JavaMailSender mailSender; // Mail sender bean

    @Autowired
    private freemarker.template.Configuration freemarkerConfig; // Freemarker configuration for PDF template

    // Create a logger instance
    private static final Logger log = LoggerFactory.getLogger(FlightNotificationService.class);

    private static final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
    private static final DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
    private static final DateTimeFormatter fullDateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm ddMMMyyyy");

    private String formatFlightTime(LocalDateTime date, LocalDateTime time) {
        if (date != null && time != null) {
            LocalDateTime combinedDateTime = LocalDateTime.of(date.toLocalDate(), time.toLocalTime());
            return combinedDateTime.format(fullDateTimeFormatter); // Using the fullDateTimeFormatter defined above
        }
        return ""; // Return empty string if either date or time is null
    }

    // Generates the flight notification PDF
    public byte[] createFlightNotificationPdf(FlightNotificationDto notificationDto) throws IOException, TemplateException {
        return generatePdf(notificationDto);
    }


    public void sendFlightNotificationEmail(FlightNotificationDto notificationDto, String toEmail)
            throws IOException, TemplateException, MessagingException {

        // Log the details of the Notification DTO
        log.info("Notification DTO Data - PassengerName: {}, BookingReference: {}",
                notificationDto.getPassengerName(), notificationDto.getBookingReference());

        log.info("Fare Calculation: {}", notificationDto.getFareCalculation());
        log.info("Payment Form: {}", notificationDto.getPaymentForm());
        log.info("Endorsements: {}", notificationDto.getEndorsements());

        //FARE DETAILS
        log.info("Base Fare: {}", notificationDto.getBaseFare());
        log.info("Taxes: {}", notificationDto.getTaxes());
        log.info("Carrier Imposed Fees from DTO: {}", notificationDto.getCarrierImposedFees());
        log.info("Total Amount: {}", notificationDto.getTotalAmount());
        log.info("Fee: {}", notificationDto.getFee());
        log.info("Total OB Fees: {}", notificationDto.getTotalOBFees());
        log.info("Grand Total: {}", notificationDto.getGrandTotal());


        byte[] pdfBytes = createFlightNotificationPdf(notificationDto);
        //Call the new email sending method with the detailed notification DTO
        sendEmailWithAttachment(toEmail, "Web Booking eTicket", notificationDto, pdfBytes, "FlightTicket.pdf");
    }



    private byte[] generatePdf(FlightNotificationDto notificationDto) throws IOException, TemplateException {
        // Load the PDF template
        Template pdfTemplate = freemarkerConfig.getTemplate("pdf-template.ftl");

        //Prepare model data with proper formatting
        Map<String, Object> model = new HashMap<>();
        model.put("passengerName", notificationDto.getPassengerName() != null ? notificationDto.getPassengerName() : "");
        model.put("bookingReference", notificationDto.getBookingReference() != null ? notificationDto.getBookingReference() : "");
        model.put("ticketNumber", notificationDto.getTicketNumber() != null ? notificationDto.getTicketNumber() : "");
        model.put("issuingOffice", notificationDto.getIssuingOffice() != null ? notificationDto.getIssuingOffice() : "");

        // Set ISSUE DATE to the actual current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();
        String formattedIssueDate = currentDateTime.format(fullDateTimeFormatter); // Uses "HH:mm ddMMMyyyy" format
        model.put("issueDate", formattedIssueDate);

        // Format arrival and departure times using the new formatter
        model.put("departureTime", formatFlightTime(notificationDto.getDepartureDate(), notificationDto.getDepartureTime()));
        model.put("arrivalTime", formatFlightTime(notificationDto.getArrivalDate(), notificationDto.getArrivalTime()));



        // Load logo and prohibited image absolute paths
        model.put("logoPath", "file:///C:/POC/Fastays%20logo.jpg"); // %20 replaces spaces in URL
        model.put("prohibitedPath", "file:///C:/POC/Prohibitedlogo.jpg");

        model.put("flightDate", notificationDto.getFlightDate() != null ? notificationDto.getFlightDate() : "");
        model.put("departureCity", notificationDto.getDepartureCity() != null ? notificationDto.getDepartureCity() : "");
        model.put("arrivalCity", notificationDto.getArrivalCity() != null ? notificationDto.getArrivalCity() : "");

        // Format NVB and NVA dates
        model.put("nvbDate", notificationDto.getNvbDate() != null ? notificationDto.getNvbDate().format(dateFormatter) : "");
        model.put("nvaDate", notificationDto.getNvaDate() != null ? notificationDto.getNvaDate().format(dateFormatter) : "");

        // Terminal for both From and To
        model.put("fromTerminal", notificationDto.getTerminal() != null ? notificationDto.getTerminal() : "");
        model.put("toTerminal", notificationDto.getTerminal() != null ? notificationDto.getTerminal() : "");

        model.put("flightClass", notificationDto.getFlightClass() != null ? notificationDto.getFlightClass() : "");
        model.put("baggage", notificationDto.getBaggage() != null ? notificationDto.getBaggage() : "");
        model.put("fareBasis", notificationDto.getFareBasis() != null ? notificationDto.getFareBasis() : "");
        model.put("operatedBy", notificationDto.getOperatedBy() != null ? notificationDto.getOperatedBy() : "");
        model.put("marketedBy", notificationDto.getMarketedBy() != null ? notificationDto.getMarketedBy() : "");
        model.put("departureAirport", notificationDto.getDepartureAirport() != null ? notificationDto.getDepartureAirport() : "");
        model.put("arrivalAirport", notificationDto.getArrivalAirport() != null ? notificationDto.getArrivalAirport() : "");
        model.put("terminal", notificationDto.getTerminal() != null ? notificationDto.getTerminal() : "");

        model.put("flightDuration", notificationDto.getFlightDuration() != null ? notificationDto.getFlightDuration() : "");
        model.put("bookingStatus1", notificationDto.getBookingStatus1() != null ? notificationDto.getBookingStatus1() : "");

        model.put("departureDate", notificationDto.getDepartureDate() != null ? notificationDto.getDepartureDate() : "");
        model.put("flightNumber", notificationDto.getFlightNumber() != null ? notificationDto.getFlightNumber() : "");

        model.put("fareCalculation", notificationDto.getFareCalculation() != null ? notificationDto.getFareCalculation() : "");
        model.put("paymentForm", notificationDto.getPaymentForm() != null ? notificationDto.getPaymentForm() : "");
        model.put("endorsements", notificationDto.getEndorsements() != null ? notificationDto.getEndorsements() : "");


        //FARE DETAILS
        model.put("baseFare", notificationDto.getBaseFare() != null ? notificationDto.getBaseFare() : BigDecimal.ZERO);
        model.put("taxes", notificationDto.getTaxes() != null ? notificationDto.getTaxes() : BigDecimal.ZERO);
        model.put("carrierImposedFees", notificationDto.getCarrierImposedFees() != null ? notificationDto.getCarrierImposedFees() : BigDecimal.ZERO);
        model.put("totalAmount", notificationDto.getTotalAmount() != null ? notificationDto.getTotalAmount() : BigDecimal.ZERO);
        model.put("fee", notificationDto.getFee() != null ? notificationDto.getFee() : BigDecimal.ZERO);
        model.put("totalOBFees", notificationDto.getTotalOBFees() != null ? notificationDto.getTotalOBFees() : BigDecimal.ZERO);
        model.put("grandTotal", notificationDto.getGrandTotal() != null ? notificationDto.getGrandTotal() : BigDecimal.ZERO);

        // Render the HTML content to a PDF byte array
        StringWriter writer = new StringWriter();
        pdfTemplate.process(model, writer);

        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocumentFromString(writer.toString());
            renderer.layout();
            renderer.createPDF(baos);
            return baos.toByteArray();
        } catch (DocumentException e) {
            throw new IOException("Error generating PDF document: " + e.getMessage(), e);
        }
    }


    private String formatFlightDateTime(LocalDateTime dateTime) {
        if (dateTime != null) {
            return dateTime.format(fullDateTimeFormatter);
        }
        return ""; // Return empty string if null
    }


    // Updated method to send an email with the PDF attachment
        private void sendEmailWithAttachment (String toEmail, String subject, FlightNotificationDto notificationDto,
        byte[] pdfBytes, String attachmentName) throws MessagingException, IOException, TemplateException {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            // Setting recipient and subject
            helper.setTo(toEmail);
            helper.setSubject(subject);

            // Load email template
            Template emailTemplate = freemarkerConfig.getTemplate("email-template.ftl");

            // Prepare the data model for Freemarker template
            Map<String, Object> model = new HashMap<>();
            model.put("passengerName", notificationDto.getPassengerName());
            model.put("bookingReference", notificationDto.getBookingReference());
            model.put("passengerEmail", toEmail);

            // Format the current date and time in the desired format
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("EEE, dd MMM, yyyy, h:mm a");
            String formattedDate = now.format(dateFormatter);

            model.put("formattedDate", formattedDate); // formatted date to the model

            // Render template to a string
            StringWriter writer = new StringWriter();
            emailTemplate.process(model, writer);
            String emailContent = writer.toString();

            // Set the HTML content in the email body
            helper.setText(emailContent, true);

            // Attach PDF
            Resource pdfResource = new ByteArrayResource(pdfBytes);
            helper.addAttachment(attachmentName, pdfResource);

            // Send the email
            mailSender.send(message);
        }
    }











