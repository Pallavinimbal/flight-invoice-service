package com.example.flight.controller;

import com.example.flight.dto.FlightNotificationDto;
import com.example.flight.entity.FlightNotification;
import com.example.flight.mapper.FlightNotificationMapper;
import com.example.flight.repository.FlightNotificationRepository;
import com.example.flight.service.FlightNotificationService;
import freemarker.template.TemplateException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import jakarta.mail.MessagingException;
import java.io.IOException;

@RestController
@RequestMapping("/api/flight")
public class FlightNotificationController {

    @Autowired
    private FlightNotificationService flightNotificationService;

    @Autowired
    private FlightNotificationMapper flightNotificationMapper;

    @Autowired
    private FlightNotificationRepository flightNotificationRepository; // repository for database operations

    @PostMapping("/send-notification")
    public ResponseEntity<String> sendNotification(@Valid @RequestBody FlightNotificationDto flightNotificationDto) {
        try {
            // Map DTO to entity
            FlightNotification flightNotification = flightNotificationMapper.toEntity(flightNotificationDto);

            // Save flightNotification to the database
            flightNotificationRepository.save(flightNotification);

            // Send the email
            flightNotificationService.sendFlightNotificationEmail(flightNotificationDto, flightNotificationDto.getTo());

            return ResponseEntity.ok("Flight notification sent successfully!");
        } catch (IOException | TemplateException | MessagingException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to send flight notification: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("An unexpected error occurred: " + e.getMessage());
        }
        }
    // Exception handler for validation errors
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        String errorMessage = "Validation error: " + ex.getBindingResult().getAllErrors().get(0).getDefaultMessage();
        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
    }
}
