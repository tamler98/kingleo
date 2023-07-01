package com.nilesh.springCRUD.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name = "users")
public class AccountEntity {
	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;

	@Column(name = "first_name")
	private String first_name;

	@Column(name = "last_name")
	private String last_name;

	@Column(name = "address")
	private String address;
	private String password;

	private String email;
	private String phone;
	private String province;
	private String district;
	private String description;
	private int count_of_order;
	private int count_of_rate;

	@Column(name = "photo")
	@Lob
	private byte[] photo;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<RoleEntity> roles = new HashSet<>();

	@OneToOne(mappedBy = "accountEntity", cascade = CascadeType.ALL)
	private BookingCartEntity bookingCartEntity;
	@OneToMany(mappedBy = "accountEntity")
	private List<RatingEntity> ratingEntities;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(Set<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public BookingCartEntity getBookingCartEntity() {
		return bookingCartEntity;
	}

	public void setBookingCartEntity(BookingCartEntity bookingCartEntity) {
		this.bookingCartEntity = bookingCartEntity;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCount_of_order() {
		return count_of_order;
	}

	public void setCount_of_order(int count_of_order) {
		this.count_of_order = count_of_order;
	}

	public int getCount_of_rate() {
		return count_of_rate;
	}

	public void setCount_of_rate(int count_of_rate) {
		this.count_of_rate = count_of_rate;
	}

	public List<RatingEntity> getRatingEntities() {
		return ratingEntities;
	}

	public void setRatingEntities(List<RatingEntity> ratingEntities) {
		this.ratingEntities = ratingEntities;
	}
}
