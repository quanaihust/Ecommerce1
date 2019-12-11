/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nguyen Minh Dang
 */
@Entity
@Table(name = "myOrder")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyOrder.findAll", query = "SELECT m FROM MyOrder m")
    , @NamedQuery(name = "MyOrder.findByOrderID", query = "SELECT m FROM MyOrder m WHERE m.orderID = :orderID")
    , @NamedQuery(name = "MyOrder.findByTotalMoney", query = "SELECT m FROM MyOrder m WHERE m.totalMoney = :totalMoney")
    , @NamedQuery(name = "MyOrder.findByDateCreate", query = "SELECT m FROM MyOrder m WHERE m.dateCreate = :dateCreate")})
public class MyOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "orderID")
    private Integer orderID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "totalMoney")
    private int totalMoney;
    @Column(name = "dateCreate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreate;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private MyUser userID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "myOrder")
    private Collection<MyOrderDetail> myOrderDetailCollection;

    public MyOrder() {
    }

    public MyOrder(Integer orderID) {
        this.orderID = orderID;
    }

    public MyOrder(Integer orderID, int totalMoney) {
        this.orderID = orderID;
        this.totalMoney = totalMoney;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public MyUser getUserID() {
        return userID;
    }

    public void setUserID(MyUser userID) {
        this.userID = userID;
    }

    @XmlTransient
    public Collection<MyOrderDetail> getMyOrderDetailCollection() {
        return myOrderDetailCollection;
    }

    public void setMyOrderDetailCollection(Collection<MyOrderDetail> myOrderDetailCollection) {
        this.myOrderDetailCollection = myOrderDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyOrder)) {
            return false;
        }
        MyOrder other = (MyOrder) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.MyOrder[ orderID=" + orderID + " ]";
    }
    
}
