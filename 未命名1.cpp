#include<bits/stdc++.h>
using namespace std;
int main() {
    int N; // 总共的星期数
    std::cin >> N;

    std::vector<int> prices(N); // 每周的进货单价
    for (int i = 0; i < N; i++) {
        std::cin >> prices[i];
    }

    std::vector<int> orders(N); // 每周的订单数量
    for (int i = 0; i < N; i++) {
        std::cin >> orders[i];
    }

    int M; // 每件货物冷藏每周需要花费
    std::cin >> M;

    std::vector<int> dp(N, std::numeric_limits<int>::max()); // 动态规划数组
    dp[0] = 0; // 第 1 周的进货开销为 0

    for (int i = 1; i < N; i++) {
        int minCost = std::numeric_limits<int>::max();

        for (int j = 0; j < i; j++) {
            int cost = dp[j] + (orders[i] - orders[j]) * prices[i] + M * (i - j - 1);
            minCost = std::min(minCost, cost);
        }

        dp[i] = std::min(dp[i-1], minCost);
    }

    std::cout << dp[N-1] << std::endl; // 输出最小进货开销

    return 0;
}
