package com.ashitosh.flywaypoc.user.entity;

import com.ashitosh.flywaypoc.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "users")
@DynamicUpdate
@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class User extends BaseEntity {

  private static final long serialVersionUID = 1L;

  @Column(nullable = false, unique = true, length = 50)
  private String uuid;

  @Column(nullable = false)
  private String name;

  @Column(name = "is_active", nullable = false)
  private Boolean isActive = true;
}