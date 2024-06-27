package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	// db의 컬럼명과 동일한 이름으로 생성함. 일반적으로 생성후 수정 할 일 없다
	private int p_idx, price, p_rate, sale_price, volume, stock, sales;
	private String brand, p_name, scent, s_image, l_image, ad_image;

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getP_rate() {
		return p_rate;
	}

	public void setP_rate(int p_rate) {
		this.p_rate = p_rate;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getScent() {
		return scent;
	}

	public void setScent(String scent) {
		this.scent = scent;
	}

	public String getS_image() {
		return s_image;
	}

	public void setS_image(String s_image) {
		this.s_image = s_image;
	}

	public String getL_image() {
		return l_image;
	}

	public void setL_image(String l_image) {
		this.l_image = l_image;
	}

	public String getAd_image() {
		return ad_image;
	}

	public void setAd_image(String ad_image) {
		this.ad_image = ad_image;
	}

}
