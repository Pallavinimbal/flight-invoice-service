package com.example.flight.dto;

import lombok.Data;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class FlightNotificationDto {
    private Long id;

    @NotNull(message = "From cannot be null")
    private String from;

    private LocalDateTime date;
    @NotNull(message = "Subject cannot be null")
    private String subject;
    private String to;  // This will be used as passengerEmail
    private String passengerName;
    private String bookingReference;
    private String ticketNumber;
    private String issuingOffice;

    @NotNull(message = "Issue date cannot be null") // Correct usage of @NotNull
    private LocalDateTime issueDate;

    private LocalDateTime flightDate;
    private String departureCity;
    private String arrivalCity;

    private String departureAirport;
    private String arrivalAirport;
    private String terminal;

    private String flightClass;
    private String baggage;
    private String fareBasis;

    private LocalDateTime nvbDate;
    private String flightDuration;

    private String operatedBy;
    private String marketedBy;

    private String bookingStatus1;
    private LocalDateTime nvaDate;

    // Missing Fields
    private String flightNumber;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private LocalDateTime departureDate;
    private LocalDateTime arrivalDate;

    // Payment details
    private String fareCalculation;
    private String paymentForm;
    private String endorsements;
    private BigDecimal baseFare;
    private BigDecimal taxes;
    private BigDecimal carrierFees;
    private BigDecimal totalAmount;
    private BigDecimal fee;
    private BigDecimal totalOBFees;
    private BigDecimal grandTotal;

}

