package edu.sm.app;

import edu.sm.util.Utils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Scanner;

public class Main {
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("관리자 애플리케이션을 실행합니다.");

        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        Utils utils = context.getBean("utils", Utils.class);

        while (true) {
            try {
                displayMainMenu();
                int choice = scanner.nextInt();
                scanner.nextLine();

                switch (choice) {
                    case 1 -> utils.manageCustomers();
                    case 2 -> utils.manageAddresses();
                    case 3 -> utils.manageProducts();
                    case 4 -> utils.manageCategories();
                    case 5 -> utils.manageBoards();
                    case 6 -> utils.manageOrders();
                    case 7 -> utils.managePayments();
                    case 8 -> utils.manageStatisticsAnalysis();
                    case 9 -> {
                        System.out.println("프로그램을 종료합니다..");
                        return;
                    }
                    default -> System.out.println("잘못된 선택입니다. 다시 선택해주세요.");
                }
            } catch (Exception e) {
                System.out.println("오류가 발생했습니다: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }


    private static void displayMainMenu() {
        System.out.println("\n==============================");
        System.out.println("       관리자 애플리케이션       ");
        System.out.println("==============================");
        System.out.println("1. 회원 관리");
        System.out.println("2. 배송지 관리");
        System.out.println("3. 상품 관리");
        System.out.println("4. 카테고리 관리");
        System.out.println("5. 게시판 관리");
        System.out.println("6. 주문 관리");
        System.out.println("7. 결제 관리");
        System.out.println("8. 통계 분석");
        System.out.println("9. 종료");
        System.out.print("메뉴를 선택하세요: ");
    }
}