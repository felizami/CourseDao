package com.leapfrog.coursedao.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-07-28T14:42:09")
@StaticMetamodel(Course.class)
public class Course_ { 

    public static volatile SingularAttribute<Course, Integer> id;
    public static volatile SingularAttribute<Course, Double> amount;
    public static volatile SingularAttribute<Course, Double> duration;
    public static volatile SingularAttribute<Course, Boolean> status;
    public static volatile SingularAttribute<Course, String> description;
    public static volatile SingularAttribute<Course, String> durationType;
    public static volatile SingularAttribute<Course, String> courseName;

}