<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = application.getRealPath("/"); //상대경로로 지정해준다.
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder+"resources/images", maxSize, encType, new DefaultFileRenamePolicy());
	//MultipartRequest 클래스를 이용해 파일 업로드 하기 위해 먼저 MultipartRequest 객체 생성
	String productId = multi.getParameter("productId");
	
	String name = multi.getParameter("name");
	//getParameter - 요청 파라미터 이름이 name인값을 전달받음)
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	//multi 메소드를 사용하여 웹 브라우저가 전송한 multipart/form-data 유형 요청 파라미터를 읽어오고 파일을 업로드
	
	
	ProductRepository dao = ProductRepository.getInstance();

	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);

	dao.addProduct(newProduct);

	response.sendRedirect("products.jsp");
%>
