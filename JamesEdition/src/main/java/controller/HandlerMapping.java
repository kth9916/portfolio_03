package controller;

/*
 * Factory 객체
 * -> Controller 객체 생성은 전담한다.
 */
public class HandlerMapping {
	//static 초기화 시 한번만 만들어짐
	private static HandlerMapping instance = new HandlerMapping();
	//외부에서 생성 불가능하게 한다
	private HandlerMapping() {}
	//static해서 만든 instance를 외부에서 공유한다
	public static HandlerMapping getInstance() {
		return instance;
	}
	
	//create(String command) : Controller 객체 생성 메서드
	public Controller create(String command) {
		Controller controller = null;
		if (command.contentEquals("getlist"))
			controller = new ProductListController();
		else if (command.contentEquals("detailproduct"))
			controller = new ProductInfoController();
		return controller;
	}
}
