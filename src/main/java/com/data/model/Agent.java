package com.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Code written by: Tony (Zongzheng) Li
 * Last modified on (DD/MM/YY): 05/14/21
 */

@Entity
@Table(name="agents")
public class Agent {

    @Id @Column(name="AgentId")
    private Integer AgentId;

    @Column(name="AgtFirstName")
    private String AgtFirstName;

    @Column(name="AgtMiddleInitial")
    private String AgtMiddleInitial;

    @Column(name="AgtLastName")
    private String AgtLastName;

    @Column(name="AgtBusPhone")
    private String AgtBusPhone;

    @Column(name="AgtEmail")
    private String AgtEmail;

    @Column(name="AgtPosition")
    private String AgtPosition;

    @Column(name="AgencyId")
    private Integer AgencyId;

    //Default constructor required to perform the find method.
    public Agent() {
    }

    public Agent(Integer agentId, String agtFirstName, String agtMiddleInitial, String agtLastName, String agtBusPhone, String agtEmail, String agtPosition, Integer agencyId) {
        AgentId = agentId;
        AgtFirstName = agtFirstName;
        AgtMiddleInitial = agtMiddleInitial;
        AgtLastName = agtLastName;
        AgtBusPhone = agtBusPhone;
        AgtEmail = agtEmail;
        AgtPosition = agtPosition;
        AgencyId = agencyId;
    }

    public Integer getAgentId() {
        return AgentId;
    }

    public void setAgentId(Integer agentId) {
        AgentId = agentId;
    }

    public String getAgtFirstName() {
        return AgtFirstName;
    }

    public void setAgtFirstName(String agtFirstName) {
        AgtFirstName = agtFirstName;
    }

    public String getAgtMiddleInitial() {
        return AgtMiddleInitial;
    }

    public void setAgtMiddleInitial(String agtMiddleInitial) {
        AgtMiddleInitial = agtMiddleInitial;
    }

    public String getAgtLastName() {
        return AgtLastName;
    }

    public void setAgtLastName(String agtLastName) {
        AgtLastName = agtLastName;
    }

    public String getAgtBusPhone() {
        return AgtBusPhone;
    }

    public void setAgtBusPhone(String agtBusPhone) {
        AgtBusPhone = agtBusPhone;
    }

    public String getAgtEmail() {
        return AgtEmail;
    }

    public void setAgtEmail(String agtEmail) {
        AgtEmail = agtEmail;
    }

    public String getAgtPosition() {
        return AgtPosition;
    }

    public void setAgtPosition(String agtPosition) {
        AgtPosition = agtPosition;
    }

    public Integer getAgencyId() {
        return AgencyId;
    }

    public void setAgencyId(Integer agencyId) {
        AgencyId = agencyId;
    }

    @Override
    public String toString() {
        return "Agent{" +
                "AgtFirstName='" + AgtFirstName + '\'' +
                ", AgtMiddleInitial='" + AgtMiddleInitial + '\'' +
                ", AgtLastName='" + AgtLastName + '\'' +
                '}';
    }

}
