package edu.sm.util;

import edu.sm.dto.*;
import edu.sm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;


@Component
public class Utils {
    private static Utils instance;
    private final CustomerService customerService;
    private final AddressService addressService;
    private final BoardService boardService;
    private final CartService cartService;
    private final DeliveryService deliveryService;
    private final MileageService mileageService;
    private final WishService wishService;
    private final ProductService productService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;
    private static final Scanner scanner = new Scanner(System.in);

    @Autowired
    private Utils(CustomerService customerService, AddressService addressService,
                  BoardService boardService, CartService cartService,
                  DeliveryService deliveryService, MileageService mileageService,
                  WishService wishService, ProductService productService, OrderService orderService,
                  OrderDetailService orderDetailService) {
        this.customerService = customerService;
        this.addressService = addressService;
        this.boardService = boardService;
        this.cartService = cartService;
        this.deliveryService = deliveryService;
        this.mileageService = mileageService;
        this.wishService = wishService;
        this.productService = productService;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
        instance = this;
    }

    public static Utils getInstance() {
        return instance;
    }


    public Customer registerCustomer() throws Exception {
        System.out.println("회원가입을 시작합니다.");
        System.out.print("사용자명: ");
        String username = scanner.nextLine();
        System.out.print("비밀번호: ");
        String password = scanner.nextLine();
        System.out.print("이름: ");
        String name = scanner.nextLine();
        System.out.print("전화번호: ");
        String phoneNumber = scanner.nextLine();

        Customer customer = Customer.builder()
                .username(username)
                .pw(password)
                .name(name)
                .pNumber(phoneNumber)
                .signUpDate(new Date())
                .role("CUST")
                .build();

        customer = customerService.add(customer);
        System.out.println("회원가입이 완료되었습니다. 고객 ID: " + customer.getCustId());

        // 배송지 입력
        Address address = registerAddress(customer.getCustId());
        System.out.println("기본 배송지가 등록되었습니다. 주소 ID: " + address.getAddressId());

        // 마일리지 초기화
        Mileage mileage = Mileage.builder()
                .custId(customer.getCustId())
                .balance(0)
                .build();
        mileageService.add(mileage);

        return customer;
    }

    public Customer login() throws Exception {
        System.out.println("로그인을 시작합니다.");
        System.out.print("사용자명: ");
        String username = scanner.nextLine();
        System.out.print("비밀번호: ");
        String password = scanner.nextLine();

        List<Customer> customers = customerService.get();
        for (Customer customer : customers) {
            if (customer.getUsername().equals(username) && customer.getPw().equals(password)) {
                System.out.println("로그인 성공!");
                return customer;
            }
        }
        System.out.println("로그인 실패. 사용자명 또는 비밀번호가 잘못되었습니다.");
        return null;
    }
    public void deleteCustomer(Customer customer) throws Exception {
        customerService.remove(customer.getCustId());
        System.out.println("고객 계정이 삭제되었습니다.");
    }

    public Customer updateCustomerInfo(Customer customer) throws Exception {
        System.out.println("회원 정보를 변경하지 않으려면 엔터를 누르세요..");

        System.out.print("새로운 사용자명 (현재: " + customer.getUsername() + "): ");
        String newUsername = scanner.nextLine();
        if (!newUsername.isEmpty()) {
            customer.setUsername(newUsername);
        }

        System.out.print("새로운 비밀번호: ");
        String newPassword = scanner.nextLine();
        if (!newPassword.isEmpty()) {
            customer.setPw(newPassword);
        }

        System.out.print("새로운 이름 (현재: " + customer.getName() + "): ");
        String newName = scanner.nextLine();
        if (!newName.isEmpty()) {
            customer.setName(newName);
        }

        System.out.print("새로운 전화번호 (현재: " + customer.getPNumber() + "): ");
        String newPhoneNumber = scanner.nextLine();
        if (!newPhoneNumber.isEmpty()) {
            customer.setPNumber(newPhoneNumber);
        }

        return customerService.modify(customer);
    }

    private Address registerAddress(Integer custId) throws Exception {
        System.out.println("배송지를 등록합니다.");
        System.out.print("받는 사람 이름: ");
        String name = scanner.nextLine();
        System.out.print("전화번호: ");
        String phone = scanner.nextLine();
        System.out.print("주소: ");
        String address = scanner.nextLine();
        System.out.print("상세주소: ");
        String addressDetail = scanner.nextLine();
        System.out.print("우편번호: ");
        String zipCode = scanner.nextLine();
        System.out.print("요청사항: ");
        String request = scanner.nextLine();

        Address newAddress = Address.builder()
                .custId(custId)
                .name(name)
                .phone(phone)
                .address(address)
                .addressDetail(addressDetail)
                .zipCode(zipCode)
                .request(request)
                .def("Y")  // 첫 번째 주소이므로 기본 주소로 설정
                .build();

        return addressService.add(newAddress);
    }

    public void setDefaultAddress(Integer custId) throws Exception {
        System.out.print("기본 배송지로 설정할 주소 ID를 입력하세요: ");
        Integer addressId = Integer.parseInt(scanner.nextLine());
        addressService.setDefaultAddress(addressId, custId);
        System.out.println("기본 배송지가 설정되었습니다.");
    }


    public void addToCart(Customer customer) throws Exception {
        System.out.print("상품 ID를 입력하세요: ");
        Integer productId = Integer.parseInt(scanner.nextLine());
        System.out.print("수량을 입력하세요: ");
        Integer count = Integer.parseInt(scanner.nextLine());

        Cart cart = Cart.builder()
                .custId(customer.getCustId())
                .productId(productId)
                .count(count)
                .regDate(new Date())
                .build();

        cartService.add(cart);
        System.out.println("장바구니에 상품이 추가되었습니다.");
    }

    public void updateCart() throws Exception {
        System.out.print("수정할 장바구니 항목 ID를 입력하세요: ");
        Integer cartId = Integer.parseInt(scanner.nextLine());
        Cart cart = cartService.get(cartId);
        // 수정할 정보 입력 받기
        cartService.modify(cart);
        System.out.println("장바구니 항목이 수정되었습니다.");
    }
    public void removeFromCart() throws Exception {
        System.out.print("삭제할 장바구니 항목 ID를 입력하세요: ");
        Integer cartId = Integer.parseInt(scanner.nextLine());
        cartService.remove(cartId);
        System.out.println("장바구니 항목이 삭제되었습니다.");
    }

    public void listCartItems() throws Exception {
        List<Cart> cartItems = cartService.get();
        for (Cart cart : cartItems) {
            System.out.println(cart);
        }
    }
    public void addToWishList(Customer customer) throws Exception {
        System.out.print("위시리스트에 추가할 상품 ID를 입력하세요: ");
        Integer productId = Integer.parseInt(scanner.nextLine());

        Wish wish = Wish.builder()
                .custId(customer.getCustId())
                .productId(productId)
                .regDate(new Date())
                .build();

        wishService.add(wish);
        System.out.println("위시리스트에 상품이 추가되었습니다.");
    }

    public void writeReview(Customer customer) throws Exception {
        System.out.print("리뷰를 작성할 상품 ID를 입력하세요: ");
        Integer productId = Integer.parseInt(scanner.nextLine());
        System.out.print("제목: ");
        String title = scanner.nextLine();
        System.out.print("내용: ");
        String content = scanner.nextLine();
        System.out.print("평점 (1-5): ");
        Integer rate = Integer.parseInt(scanner.nextLine());

        Board review = Board.builder()
                .custId(customer.getCustId())
                .productId(productId)
                .ntype("R")
                .title(title)
                .regDate(new Date())
                .content(content)
                .rate(rate)
                .build();

        boardService.add(review);
        System.out.println("리뷰가 작성되었습니다.");
    }

    public void writeInquiry(Customer customer) throws Exception {
        System.out.print("문의할 상품 ID를 입력하세요: ");
        Integer productId = Integer.parseInt(scanner.nextLine());
        System.out.print("제목: ");
        String title = scanner.nextLine();
        System.out.print("내용: ");
        String content = scanner.nextLine();

        Board inquiry = Board.builder()
                .custId(customer.getCustId())
                .productId(productId)
                .ntype("Q")
                .title(title)
                .regDate(new Date())
                .content(content)
                .rate(0)
                .build();

        boardService.add(inquiry);
        System.out.println("문의가 등록되었습니다.");
    }

    public void checkMileage(Customer customer) throws Exception {
        Mileage mileage = mileageService.get(customer.getCustId());
        System.out.println("현재 마일리지: " + mileage.getBalance());
    }

    public void viewDeliveryStatus(Customer customer) throws Exception {
        System.out.print("배송 상태를 확인할 주문 ID를 입력하세요: ");
        Integer orderId = Integer.parseInt(scanner.nextLine());
        Delivery delivery = deliveryService.viewShippingStatus(orderId);
        if (delivery != null) {
            System.out.println("배송 상태: " + delivery.getStatus());
        } else {
            System.out.println("해당 주문에 대한 배송 정보를 찾을 수 없습니다.");
        }
    }

    public void removeFromWishList() throws Exception {
        System.out.print("삭제할 위시리스트 항목 ID를 입력하세요: ");
        Integer wishId = Integer.parseInt(scanner.nextLine());
        wishService.remove(wishId);
        System.out.println("위시리스트 항목이 삭제되었습니다.");
    }

    public void listWishItems() throws Exception {
        List<Wish> wishItems = wishService.get();
        for (Wish wish : wishItems) {
            System.out.println(wish);
        }
    }

    public void listProduct() throws Exception {
        List<Product> products = productService.get();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println("\n=== 상품 목록 ===");

        // 헤더 출력
        System.out.println("ID | 상품명 | 가격 | 등록일 | 수량 | 공개 여부 | 카테고리 ID");
        System.out.println("------------------------------------------------------------");

        // 상품 정보 출력
        for (Product product : products) {
            System.out.printf("%d | %s | %,d원 | %s | %d | %s | %d%n",
                    product.getProductId(),
                    product.getName(),
                    product.getPrice(),
                    dateFormat.format(product.getRegDate()),
                    product.getCount(),
                    product.isPublic() ? "공개" : "비공개",
                    product.getCategoryId());
        }

        System.out.println("------------------------------------------------------------");
        System.out.println("총 " + products.size() + "개의 상품이 있습니다.");
    }


    public void getProduct() throws Exception {
        System.out.print("조회할 상품의 ID를 입력하세요: ");
        Integer productId = Integer.parseInt(scanner.nextLine());
        Product product = productService.get(productId);
        if (product != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            System.out.println("\n===== 상품 정보 =====");
            System.out.println("상품 ID: " + product.getProductId());
            System.out.println("카테고리 ID: " + product.getCategoryId());
            System.out.println("상품명: " + product.getName());
            System.out.println("가격: " + product.getPrice());
            System.out.println("등록일: " + dateFormat.format(product.getRegDate()));
            System.out.println("수량: " + product.getCount());
            System.out.println("공개 여부: " + (product.isPublic() ? "공개" : "비공개"));
            System.out.println("----------------------");
            System.out.println("설명: " + product.getDescription());
            System.out.println("----------------------");

            // 이미지 정보 출력
            boolean hasImages = false;
            if (product.getImg1() != null) { System.out.println("이미지 1: " + product.getImg1()); hasImages = true; }
            if (product.getImg2() != null) { System.out.println("이미지 2: " + product.getImg2()); hasImages = true; }
            if (product.getImg3() != null) { System.out.println("이미지 3: " + product.getImg3()); hasImages = true; }
            if (product.getImg4() != null) { System.out.println("이미지 4: " + product.getImg4()); hasImages = true; }
            if (product.getImg5() != null) { System.out.println("이미지 5: " + product.getImg5()); hasImages = true; }

            if (!hasImages) {
                System.out.println("등록된 이미지가 없습니다.");
            }
        } else {
            System.out.println("\n상품을 찾을 수 없습니다.");
        }
    }

    public Order createOrder(Customer customer) throws Exception {
        System.out.println("새 주문 생성");
        System.out.print("상품 개수: ");
        int productCount = Integer.parseInt(scanner.nextLine());
        System.out.print("총 가격: ");
        int totalPrice = Integer.parseInt(scanner.nextLine());
        System.out.print("이름: ");
        String name = scanner.nextLine();
        System.out.print("전화번호: ");
        String phone = scanner.nextLine();
        System.out.print("주소1: ");
        String address1 = scanner.nextLine();
        System.out.print("주소2: ");
        String address2 = scanner.nextLine();
        System.out.print("우편번호: ");
        String zipCode = scanner.nextLine();
        System.out.print("요청사항: ");
        String request = scanner.nextLine();
        System.out.print("카드: ");
        String card = scanner.nextLine();
        System.out.print("사용 마일리지: ");
        int usedMileage = Integer.parseInt(scanner.nextLine());

        Order order = Order.builder()
                .custId(customer.getCustId())
                .productCount(productCount)
                .price(totalPrice)
                .orderDate(new Date())
                .name(name)
                .phone(phone)
                .address1(address1)
                .address2(address2)
                .zipCode(zipCode)
                .request(request)
                .card(card)
                .usedMileage(usedMileage)
                .build();

        order = orderService.add(order);
        System.out.println("새 주문이 생성되었습니다. 주문 ID: " + order.getOrderId());

        // 주문 상세 정보 추가
        for (int i = 0; i < productCount; i++) {
            System.out.println("주문 상세 " + (i + 1) + " 입력:");
            System.out.print("상품 ID: ");
            int productId = Integer.parseInt(scanner.nextLine());
            System.out.print("가격: ");
            int price = Integer.parseInt(scanner.nextLine());
            System.out.print("수량: ");
            int count = Integer.parseInt(scanner.nextLine());

            OrderDetail orderDetail = OrderDetail.builder()
                    .productId(productId)
                    .orderId(order.getOrderId())
                    .price(price)
                    .count(count)
                    .build();

            orderDetailService.add(orderDetail);
        }

        return order;
    }

    // 주문 조회 메서드
    public void viewOrder() throws Exception {
        System.out.print("조회할 주문 ID: ");
        int orderId = Integer.parseInt(scanner.nextLine());
        Order order = orderService.get(orderId);
        if (order != null) {
            System.out.println("주문 정보:");
            System.out.println(order);

            System.out.println("주문 상세 정보:");
            List<OrderDetail> orderDetails = orderDetailService.get();
            for (OrderDetail detail : orderDetails) {
                if (detail.getOrderId().equals(orderId)) {
                    System.out.println(detail);
                }
            }
        } else {
            System.out.println("주문을 찾을 수 없습니다.");
        }
    }

    // 주문 수정 메서드
    public Order updateOrder() throws Exception {
        System.out.print("수정할 주문 ID: ");
        int orderId = Integer.parseInt(scanner.nextLine());
        Order order = orderService.get(orderId);
        if (order != null) {
            System.out.println("현재 주문 정보: " + order);
            System.out.println("수정할 필드를 입력하세요. 수정하지 않을 경우 Enter를 누르세요.");

            System.out.print("상품 개수 (" + order.getProductCount() + "): ");
            String input = scanner.nextLine();
            if (!input.isEmpty()) {
                order.setProductCount(Integer.parseInt(input));
            }

            // ... (다른 필드들에 대해서도 비슷하게 구현)

            return orderService.modify(order);
        } else {
            System.out.println("주문을 찾을 수 없습니다.");
            return null;
        }
    }

    // 주문 삭제 메서드
    public boolean deleteOrder() throws Exception {
        System.out.print("삭제할 주문 ID: ");
        int orderId = Integer.parseInt(scanner.nextLine());

        // 먼저 관련된 주문 상세 정보 삭제
        List<OrderDetail> orderDetails = orderDetailService.get();
        for (OrderDetail detail : orderDetails) {
            if (detail.getOrderId().equals(orderId)) {
                orderDetailService.remove(detail.getOrderDetailId());
            }
        }

        // 주문 삭제
        boolean deleted = orderService.remove(orderId);
        if (deleted) {
            System.out.println("주문과 관련 주문 상세 정보가 삭제되었습니다.");
        } else {
            System.out.println("주문을 삭제할 수 없습니다.");
        }
        return deleted;
    }

    // 전체 주문 목록 조회 메서드
    public void listAllOrders() throws Exception {
        List<Order> orders = orderService.get();
        if (orders.isEmpty()) {
            System.out.println("주문이 없습니다.");
        } else {
            for (Order order : orders) {
                System.out.println(order);
            }
        }
    }

    // 새로운 주문 상세 생성 메서드
    public OrderDetail createOrderDetail() throws Exception {
        System.out.println("새 주문 상세 생성");
        System.out.print("상품 ID: ");
        int productId = Integer.parseInt(scanner.nextLine());
        System.out.print("주문 ID: ");
        int orderId = Integer.parseInt(scanner.nextLine());
        System.out.print("가격: ");
        int price = Integer.parseInt(scanner.nextLine());
        System.out.print("수량: ");
        int count = Integer.parseInt(scanner.nextLine());

        OrderDetail orderDetail = OrderDetail.builder()
                .productId(productId)
                .orderId(orderId)
                .price(price)
                .count(count)
                .build();

        return orderDetailService.add(orderDetail);
    }

    // 주문 상세 조회 메서드
    public void viewOrderDetail() throws Exception {
        System.out.print("조회할 주문 상세 ID: ");
        int orderDetailId = Integer.parseInt(scanner.nextLine());
        OrderDetail orderDetail = orderDetailService.get(orderDetailId);
        if (orderDetail != null) {
            System.out.println(orderDetail);
        } else {
            System.out.println("주문 상세를 찾을 수 없습니다.");
        }
    }

    // 주문 상세 수정 메서드
    public OrderDetail updateOrderDetail() throws Exception {
        System.out.print("수정할 주문 상세 ID: ");
        int orderDetailId = Integer.parseInt(scanner.nextLine());
        OrderDetail orderDetail = orderDetailService.get(orderDetailId);
        if (orderDetail != null) {
            System.out.println("현재 주문 상세 정보: " + orderDetail);
            System.out.println("수정할 필드를 입력하세요. 수정하지 않을 경우 Enter를 누르세요.");

            System.out.print("가격 (" + orderDetail.getPrice() + "): ");
            String input = scanner.nextLine();
            if (!input.isEmpty()) {
                orderDetail.setPrice(Integer.parseInt(input));
            }

            System.out.print("수량 (" + orderDetail.getCount() + "): ");
            input = scanner.nextLine();
            if (!input.isEmpty()) {
                orderDetail.setCount(Integer.parseInt(input));
            }

            return orderDetailService.modify(orderDetail);
        } else {
            System.out.println("주문 상세를 찾을 수 없습니다.");
            return null;
        }
    }

    // 주문 상세 삭제 메서드
    public boolean deleteOrderDetail() throws Exception {
        System.out.print("삭제할 주문 상세 ID: ");
        int orderDetailId = Integer.parseInt(scanner.nextLine());
        return orderDetailService.remove(orderDetailId);
    }

    // 전체 주문 상세 목록 조회 메서드
    public void listAllOrderDetails() throws Exception {
        List<OrderDetail> orderDetails = orderDetailService.get();
        if (orderDetails.isEmpty()) {
            System.out.println("주문 상세가 없습니다.");
        } else {
            for (OrderDetail orderDetail : orderDetails) {
                System.out.println(orderDetail);
            }
        }
    }

}