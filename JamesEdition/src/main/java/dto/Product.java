package dto;



public class Product{

	
	private String productId;	//��ǰ ���̵�
	private String pname;		//��ǰ��
	private int unitPrice; //��ǰ ����
	private String description; //��ǰ ����
	private String manufacturer;//������
	private String category; 	//�з�
	private String filename; 	//�̹��� ���ϸ�
	private int quantity;		 //��ٱ��Ͽ� ���� ����

	public Product() {
		super();
	}

	public Product(String productId, String pname) {
		this.productId = productId;
		this.pname = pname;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ",description=" + description
				+ ",manufacturer=" + manufacturer + ",category=" + category + ", filename=" + filename + ", quantity=" + quantity + "]";
	}

}
