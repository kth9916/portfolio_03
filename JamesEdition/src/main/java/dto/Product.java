package dto;



public class Product{

	
	private String productId;	//��ǰ ���̵�
	private String pname;		//��ǰ��
	private int unitPrice; //��ǰ ����
	private String description; //��ǰ ����
	private String manufacturer;//������
	private String category; 	//�з�
	private String ofile1; 	//�̹��� ���ϸ�
	private String ofile2; 	//���� �̹��� ���ϸ�
	private String ofile3; 	//���� �̹��� ���ϸ�
	private String ofile4; 	//���� �̹��� ���ϸ�
	private String ofile5; 	//���� �̹��� ���ϸ�
	private int quantity;		 //��ٱ��Ͽ� ���� ����

	public String getOfile2() {
		return ofile2;
	}

	public void setOfile2(String ofile2) {
		this.ofile2 = ofile2;
	}

	public String getOfile3() {
		return ofile3;
	}

	public void setOfile3(String ofile3) {
		this.ofile3 = ofile3;
	}

	public String getOfile4() {
		return ofile4;
	}

	public void setOfile4(String ofile4) {
		this.ofile4 = ofile4;
	}

	public String getOfile5() {
		return ofile5;
	}

	public void setOfile5(String ofile5) {
		this.ofile5 = ofile5;
	}

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


	public String getOfile1() {
		return ofile1;
	}

	public void setOfile1(String ofile1) {
		this.ofile1 = ofile1;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



}
