#include<bits/stdc++.h>
using namespace std;
int main() {
    int N; // �ܹ���������
    std::cin >> N;

    std::vector<int> prices(N); // ÿ�ܵĽ�������
    for (int i = 0; i < N; i++) {
        std::cin >> prices[i];
    }

    std::vector<int> orders(N); // ÿ�ܵĶ�������
    for (int i = 0; i < N; i++) {
        std::cin >> orders[i];
    }

    int M; // ÿ���������ÿ����Ҫ����
    std::cin >> M;

    std::vector<int> dp(N, std::numeric_limits<int>::max()); // ��̬�滮����
    dp[0] = 0; // �� 1 �ܵĽ�������Ϊ 0

    for (int i = 1; i < N; i++) {
        int minCost = std::numeric_limits<int>::max();

        for (int j = 0; j < i; j++) {
            int cost = dp[j] + (orders[i] - orders[j]) * prices[i] + M * (i - j - 1);
            minCost = std::min(minCost, cost);
        }

        dp[i] = std::min(dp[i-1], minCost);
    }

    std::cout << dp[N-1] << std::endl; // �����С��������

    return 0;
}
