package com.data.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Entity
@Table(name="bookingdetails")
public class Bookingdetails {
    private int BookingDetailId;
    private Double ItineraryNo;
    private Timestamp TripStart;
    private Timestamp TripEnd;
    private String Description;
    private String Destination;
    private BigDecimal BasePrice;
    private BigDecimal AgencyCommission;
    private Integer BookingId;
    private String RegionId;
    private String ClassId;
    private String FeeId;
    private Integer ProductSupplierId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BookingDetailId")
    public int getBookingDetailId() {
        return BookingDetailId;
    }

    public void setBookingDetailId(int bookingDetailId) {
        BookingDetailId = bookingDetailId;
    }

    @Basic
    @Column(name = "ItineraryNo")
    public Double getItineraryNo() {
        return ItineraryNo;
    }

    public void setItineraryNo(Double itineraryNo) {
        ItineraryNo = itineraryNo;
    }

    @Basic
    @Column(name = "TripStart")
    public Timestamp getTripStart() {
        return TripStart;
    }

    public void setTripStart(Timestamp tripStart) {
        TripStart = tripStart;
    }

    @Basic
    @Column(name = "TripEnd")
    public Timestamp getTripEnd() {
        return TripEnd;
    }

    public void setTripEnd(Timestamp tripEnd) {
        TripEnd = tripEnd;
    }

    @Basic
    @Column(name = "Description")
    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    @Basic
    @Column(name = "Destination")
    public String getDestination() {
        return Destination;
    }

    public void setDestination(String destination) {
        Destination = destination;
    }

    @Basic
    @Column(name = "BasePrice")
    public BigDecimal getBasePrice() {
        return BasePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        BasePrice = basePrice;
    }

    @Basic
    @Column(name = "AgencyCommission")
    public BigDecimal getAgencyCommission() {
        return AgencyCommission;
    }

    public void setAgencyCommission(BigDecimal agencyCommission) {
        AgencyCommission = agencyCommission;
    }

    @Basic
    @Column(name = "BookingId")
    public Integer getBookingId() {
        return BookingId;
    }

    public void setBookingId(Integer bookingId) {
        BookingId = bookingId;
    }

    @Basic
    @Column(name = "RegionId")
    public String getRegionId() {
        return RegionId;
    }

    public void setRegionId(String regionId) {
        RegionId = regionId;
    }

    @Basic
    @Column(name = "ClassId")
    public String getClassId() {
        return ClassId;
    }

    public void setClassId(String classId) {
        ClassId = classId;
    }

    @Basic
    @Column(name = "FeeId")
    public String getFeeId() {
        return FeeId;
    }

    public void setFeeId(String feeId) {
        FeeId = feeId;
    }

    @Basic
    @Column(name = "ProductSupplierId")
    public Integer getProductSupplierId() {
        return ProductSupplierId;
    }

    public void setProductSupplierId(Integer productSupplierId) {
        ProductSupplierId = productSupplierId;
    }

    public Bookingdetails(int bookingDetailId, Double itineraryNo, Timestamp tripStart, Timestamp tripEnd, String description, String destination, BigDecimal basePrice, BigDecimal agencyCommission, Integer bookingId, String regionId, String classId, String feeId, Integer productSupplierId) {
        BookingDetailId = bookingDetailId;
        ItineraryNo = itineraryNo;
        TripStart = tripStart;
        TripEnd = tripEnd;
        Description = description;
        Destination = destination;
        BasePrice = basePrice;
        AgencyCommission = agencyCommission;
        BookingId = bookingId;
        RegionId = regionId;
        ClassId = classId;
        FeeId = feeId;
        ProductSupplierId = productSupplierId;
    }

    public Bookingdetails() {
    }

    @Override
    public String toString() {
        return "Bookingdetails{" +
                "BookingDetailId=" + BookingDetailId +
                ", Description='" + Description + '\'' +
                '}';
    }
}
