package com.data.db;

import javax.persistence.*;

/**
 * Code written by: Tony (Zongzheng) Li
 * Last modified on:
 */

public class JPA {

    //Declares a static EntityManager
    public static EntityManager em;

    //Initializes EntityManger using 'default' persistenceUnit
    static {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }

    /**
     * Method to retrieve all instances of an entity from a table.
     * @param entityName The mapped entity class.
     * @param entity The literal name of the entity class.
     * @return List of objects containing all records retrieved from the table.
     */
    public static Object GetAll(Class<?> entityName, String entity) {
        TypedQuery<?> findAll = em.createQuery(String.format("SELECT c FROM %s AS c", entity), entityName);
        return findAll.getResultList();
    }

    /**
     * Method to retrieve a particular record via primary key.
     * @param entityName The mapped entity class.
     * @param primaryKey The Id column or primary key value of the record you're trying to retrieve.
     * @return A single object created from the record corresponding to the primary key value provided, or null if the record does not exist.
     */
    public static Object GetOne(Class<?> entityName, Object primaryKey) {
        return em.find(entityName, primaryKey);
    }
}