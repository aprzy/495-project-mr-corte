/* db name: webapp */

/* customerregistration table */
CREATE TABLE `webapp`.`customerregistration` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `cust_first_name` VARCHAR(45) NULL,
  `cust_last_name` VARCHAR(45) NULL,
  `cust_username` VARCHAR(45) NULL,
  `cust_email` VARCHAR(45) NULL,
  `cust_phone` VARCHAR(45) NULL,
  `cust_password` VARCHAR(45) NULL,
  `salt` VARCHAR(45) NULL,
  `saltedpassword` VARCHAR(45) NULL,
  `slowHashSalt` VARCHAR(200) NULL,
  PRIMARY KEY (`customerID`));
  
/* change customerregistration to customer */
ALTER TABLE `webapp`.`customerregistration` 
RENAME TO  `webapp`.`customer` ;

  
/* barberregistration table */  
CREATE TABLE `webapp`.`barberregistration` (
  `barberID` INT NOT NULL AUTO_INCREMENT,
  `barber_first_name` VARCHAR(45) NULL,
  `barber_last_name` VARCHAR(45) NULL,
  `barber_username` VARCHAR(45) NULL,
  `barber_email` VARCHAR(45) NULL,
  `barber_phone` VARCHAR(45) NULL,
  `barber_password` VARCHAR(45) NULL,
  `barber_slowHashSalt` VARCHAR(200) NULL,
  `barber_SIN` VARCHAR(45) NULL,
  `validated` VARCHAR(45) NULL,
  PRIMARY KEY (`barberID`));
  
/* change barberregistration to barber */  
ALTER TABLE `webapp`.`barberregistration` 
RENAME TO  `webapp`.`barber` ;
  
/* appointment table*/
CREATE TABLE `webapp`.`appointment` (
  `appointmentID` INT NOT NULL AUTO_INCREMENT,
  `appointment_start` DATETIME NULL,
  `appointment_end` DATETIME NULL,
  `barberID` INT NULL,
  `customerID` INT NULL,
  `customer_name` VARCHAR(45) NULL,
  `appointment_status` VARCHAR(100) NULL,
  PRIMARY KEY (`appointmentID`),
  INDEX `barberID_idx` (`barberID` ASC) VISIBLE,
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `barberID`
    FOREIGN KEY (`barberID`)
    REFERENCES `webapp`.`barber` (`barberID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `webapp`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
/* alter table to default appointment_status value to 'free' */
ALTER TABLE `webapp`.`appointment` 
CHANGE COLUMN `appointment_status` `appointment_status` VARCHAR(100) NULL DEFAULT 'free' ;