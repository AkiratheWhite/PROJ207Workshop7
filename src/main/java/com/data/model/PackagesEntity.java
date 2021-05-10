package com.data.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "packages", schema = "travelexperts")
public class PackagesEntity {
    private int PackageId;
    private String PkgName;
    private Timestamp PkgStartDate;
    private Timestamp PkgEndDate;
    private String PkgDesc;
    private BigDecimal PkgBasePrice;
    private BigDecimal PkgAgencyCommission;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PackageId", nullable = false)
    public int getPackageId() {
        return PackageId;
    }

    public void setPackageId(int packageId) {
        PackageId = packageId;
    }

    @Basic
    @Column(name = "PkgName", nullable = false, length = 50)
    public String getPkgName() {
        return PkgName;
    }

    public void setPkgName(String pkgName) {
        PkgName = pkgName;
    }

    @Basic
    @Column(name = "PkgStartDate")
    public Timestamp getPkgStartDate() {
        return PkgStartDate;
    }

    public void setPkgStartDate(Timestamp pkgStartDate) {
        this.PkgStartDate = pkgStartDate;
    }

    @Basic
    @Column(name = "PkgEndDate")
    public Timestamp getPkgEndDate() {
        return PkgEndDate;
    }

    public void setPkgEndDate(Timestamp pkgEndDate) {
        PkgEndDate = pkgEndDate;
    }

    @Basic
    @Column(name = "PkgDesc", length = 50)
    public String getPkgDesc() {
        return PkgDesc;
    }

    public void setPkgDesc(String pkgDesc) {
        PkgDesc = pkgDesc;
    }

    @Basic
    @Column(name = "PkgBasePrice", nullable = false, precision = 4)
    public BigDecimal getPkgBasePrice() {
        return PkgBasePrice;
    }

    public void setPkgBasePrice(BigDecimal pkgBasePrice) {
        PkgBasePrice = pkgBasePrice;
    }

    @Basic
    @Column(name = "PkgAgencyCommission", precision = 4)
    public BigDecimal getPkgAgencyCommission() {
        return PkgAgencyCommission;
    }

    public void setPkgAgencyCommission(BigDecimal pkgAgencyCommission) {
        PkgAgencyCommission = pkgAgencyCommission;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PackagesEntity that = (PackagesEntity) o;

        if (PackageId != that.PackageId) return false;
        if (!Objects.equals(PkgName, that.PkgName)) return false;
        if (!Objects.equals(PkgStartDate, that.PkgStartDate)) return false;
        if (!Objects.equals(PkgEndDate, that.PkgEndDate)) return false;
        if (!Objects.equals(PkgDesc, that.PkgDesc)) return false;
        if (!Objects.equals(PkgBasePrice, that.PkgBasePrice)) return false;
        if (!Objects.equals(PkgAgencyCommission, that.PkgAgencyCommission))
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = PackageId;
        result = 31 * result + (PkgName != null ? PkgName.hashCode() : 0);
        result = 31 * result + (PkgStartDate != null ? PkgStartDate.hashCode() : 0);
        result = 31 * result + (PkgEndDate != null ? PkgEndDate.hashCode() : 0);
        result = 31 * result + (PkgDesc != null ? PkgDesc.hashCode() : 0);
        result = 31 * result + (PkgBasePrice != null ? PkgBasePrice.hashCode() : 0);
        result = 31 * result + (PkgAgencyCommission != null ? PkgAgencyCommission.hashCode() : 0);
        return result;
    }
}
