package controller;

/*
 * Factory ��ü
 * -> Controller ��ü ������ �����Ѵ�.
 */
public class HandlerMapping {
	//static �ʱ�ȭ �� �ѹ��� �������
	private static HandlerMapping instance = new HandlerMapping();
	//�ܺο��� ���� �Ұ����ϰ� �Ѵ�
	private HandlerMapping() {}
	//static�ؼ� ���� instance�� �ܺο��� �����Ѵ�
	public static HandlerMapping getInstance() {
		return instance;
	}
	
	//create(String command) : Controller ��ü ���� �޼���
	public Controller create(String command) {
		Controller controller = null;
		if (command.contentEquals("getlist"))
			controller = new ProductListController();
		else if (command.contentEquals("detailproduct"))
			controller = new ProductInfoController();
		return controller;
	}
}
