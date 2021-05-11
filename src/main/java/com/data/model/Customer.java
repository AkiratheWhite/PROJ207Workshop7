package com.data.model;

import javax.persistence.*;

@Entity
@Table(name = "customers", schema = "travelexperts")
public class Customer {
    private int CustomerId;
    private String CustFirstName;
    private String CustLastName;
    private String CustAddress;
    private String CustCity;
    private String CustProv;
    private String CustPostal;
    private String CustCountry;
    private String CustHomePhone;
    private String CustBusPhone;
    private String CustEmail;
    private Integer AgentId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CustomerId")
    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int customerId) {
        CustomerId = customerId;
    }

    @Basic
    @Column(name = "CustFirstName")
    public String getCustFirstName() {
        return CustFirstName;
    }

    public void setCustFirstName(String custFirstName) {
        CustFirstName = custFirstName;
    }

    @Basic
    @Column(name = "CustLastName")
    public String getCustLastName() {
        return CustLastName;
    }

    public void setCustLastName(String custLastName) {
        CustLastName = custLastName;
    }

    @Basic
    @Column(name = "CustAddress")
    public String getCustAddress() {
        return CustAddress;
    }

    public void setCustAddress(String custAddress) {
        CustAddress = custAddress;
    }

    @Basic
    @Column(name = "CustCity")
    public String getCustCity() {
        return CustCity;
    }

    public void setCustCity(String custCity) {
        CustCity = custCity;
    }

    @Basic
    @Column(name = "CustProv")
    public String getCustProv() {
        return CustProv;
    }

    public void setCustProv(String custProv) {
        CustProv = custProv;
    }

    @Basic
    @Column(name = "CustPostal")
    public String getCustPostal() {
        return CustPostal;
    }

    public void setCustPostal(String custPostal) {
        CustPostal = custPostal;
    }

    @Basic
    @Column(name = "CustCountry")
    public String getCustCountry() {
        return CustCountry;
    }

    public void setCustCountry(String custCountry) {
        CustCountry = custCountry;
    }

    @Basic
    @Column(name = "CustHomePhone")
    public String getCustHomePhone() {
        return CustHomePhone;
    }

    public void setCustHomePhone(String custHomePhone) {
        CustHomePhone = custHomePhone;
    }

    @Basic
    @Column(name = "CustBusPhone")
    public String getCustBusPhone() {
        return CustBusPhone;
    }

    public void setCustBusPhone(String custBusPhone) {
        CustBusPhone = custBusPhone;
    }

    @Basic
    @Column(name = "CustEmail")
    public String getCustEmail() {
        return CustEmail;
    }

    public void setCustEmail(String custEmail) {
        CustEmail = custEmail;
    }

    @Basic
    @Column(name = "AgentId")
    public Integer getAgentId() {
        return AgentId;
    }

    public void setAgentId(Integer agentId) {
        AgentId = agentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (CustomerId != customer.CustomerId) return false;
        if (CustFirstName != null ? !CustFirstName.equals(customer.CustFirstName) : customer.CustFirstName != null)
            return false;
        if (CustLastName != null ? !CustLastName.equals(customer.CustLastName) : customer.CustLastName != null)
            return false;
        if (CustAddress != null ? !CustAddress.equals(customer.CustAddress) : customer.CustAddress != null)
            return false;
        if (CustCity != null ? !CustCity.equals(customer.CustCity) : customer.CustCity != null) return false;
        if (CustProv != null ? !CustProv.equals(customer.CustProv) : customer.CustProv != null) return false;
        if (CustPostal != null ? !CustPostal.equals(customer.CustPostal) : customer.CustPostal != null) return false;
        if (CustCountry != null ? !CustCountry.equals(customer.CustCountry) : customer.CustCountry != null)
            return false;
        if (CustHomePhone != null ? !CustHomePhone.equals(customer.CustHomePhone) : customer.CustHomePhone != null)
            return false;
        if (CustBusPhone != null ? !CustBusPhone.equals(customer.CustBusPhone) : customer.CustBusPhone != null)
            return false;
        if (CustEmail != null ? !CustEmail.equals(customer.CustEmail) : customer.CustEmail != null) return false;
        if (AgentId != null ? !AgentId.equals(customer.AgentId) : customer.AgentId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = CustomerId;
        result = 31 * result + (CustFirstName != null ? CustFirstName.hashCode() : 0);
        result = 31 * result + (CustLastName != null ? CustLastName.hashCode() : 0);
        result = 31 * result + (CustAddress != null ? CustAddress.hashCode() : 0);
        result = 31 * result + (CustCity != null ? CustCity.hashCode() : 0);
        result = 31 * result + (CustProv != null ? CustProv.hashCode() : 0);
        result = 31 * result + (CustPostal != null ? CustPostal.hashCode() : 0);
        result = 31 * result + (CustCountry != null ? CustCountry.hashCode() : 0);
        result = 31 * result + (CustHomePhone != null ? CustHomePhone.hashCode() : 0);
        result = 31 * result + (CustBusPhone != null ? CustBusPhone.hashCode() : 0);
        result = 31 * result + (CustEmail != null ? CustEmail.hashCode() : 0);
        result = 31 * result + (AgentId != null ? AgentId.hashCode() : 0);
        return result;
    }
//----------------------------------------------------------------------------//
    /*public Customer(){}

    public Customer(int customerId, String custFirstName, String custLastName, String custAddress, String custCity, String custProv, String custPostal, String custCountry, String custHomePhone, String custBusPhone, String custEmail, Integer agentId) {
        CustomerId = customerId;
        CustFirstName = custFirstName;
        CustLastName = custLastName;
        CustAddress = custAddress;
        CustCity = custCity;
        CustProv = custProv;
        CustPostal = custPostal;
        CustCountry = custCountry;
        CustHomePhone = custHomePhone;
        CustBusPhone = custBusPhone;
        CustEmail = custEmail;
        AgentId = agentId;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "CustFirstName='" + CustFirstName + '\'' +
                ", CustLastName='" + CustLastName + '\'' +
                '}';
    }*/
}
