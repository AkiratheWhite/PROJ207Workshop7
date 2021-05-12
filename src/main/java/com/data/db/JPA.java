package com.data.db;

import javax.persistence.*;

/**
 * Code written by: Tony (Zongzheng) Li
 * Last modified on:
 */

public class JPA {

    //Declares a static EntityManager and EntityManagerFactory
    public static EntityManager em;
    public static EntityManagerFactory emf;

    //Initializes EntityManger using 'default' persistenceUnit
    //EntityManager has to be declared within each methods so that the entity updates every time the database changes.
    static {
        emf = Persistence.createEntityManagerFactory("default");
    }

    /**
     * Method to retrieve all instances of an entity from a table.
     * @param entityName The mapped entity class.
     * @param entity The literal name of the entity class.
     * @return List of objects containing all records retrieved from the table.
     */
    public static Object GetAll(Class<?> entityName, String entity) {
        em = emf.createEntityManager();
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
        em = emf.createEntityManager();
        return em.find(entityName, primaryKey);
    }

    /**
     * Method to add a new record to a table.
     * @param newEntity The object containing information of the new record to be added to the database. Must be a JPA entity.
     * @return True if the add was successful, false if the add was unsuccessful.
     */
    public static boolean AddOne(Object newEntity) {
        em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(newEntity);
            em.getTransaction().commit();
            return true;
        } catch (Exception err) {
            System.out.println("Database error: " + err.getMessage());
            em.getTransaction().rollback();
        }
        return false;
    }

    /**
     * Method to remove a record from a table.
     * @param entityName The JPA entity class that corresponds to the table you're trying to delete from.
     * @param primaryKey The value of the primary key of the record you're trying to delete.
     * @return True if the delete was successful, false if the delete failed.
     */
    public static boolean DeleteOne(Class<?> entityName, Object primaryKey) {
        em = emf.createEntityManager();
        Object currentRecord = em.find(entityName, primaryKey); //Getting the object, if it exist.
        try {
            em.getTransaction().begin();
            em.remove(currentRecord);
            em.getTransaction().commit();
            return true;
        }  catch (Exception err) {
            System.out.println("Database error: " + err.getMessage());
        }
        return false;
    }

    /**
     * Method to update a record from a table.
     * @param updateEntity The object containing information of the new record to be added to the database. Must be a JPA entity.
     * @return True if update is successful, false if update failed.
     */
    public static boolean UpdateOne(Object updateEntity) {
        em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(updateEntity);
            em.getTransaction().commit();
            return true;
        }  catch (Exception err) {
            System.out.println("Database error: " + err.getMessage());
            em.getTransaction().rollback();
        }
        return false;
    }
}