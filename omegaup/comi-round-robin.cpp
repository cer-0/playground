// https://omegaup.com/arena/problem/COMI-Round-Robin
#include <iostream>
#include <queue>
using namespace std;

int main() {
  cin.tie(nullptr);
  ios_base::sync_with_stdio(false);

  int n, k, tid, ttex;
  queue<int> ids, tex;

  cin >> n >> k;
  for(size_t i = 0; i < n; i++) {
      cin >> tid >> ttex;
      ids.push(tid);
      tex.push(ttex);
  }

  while(!ids.empty() && !tex.empty()) {
      tid = ids.front();
      ttex = tex.front();
      if(ttex <= 0) {
          cout << tid << "\n";
          ids.pop();
          tex.pop();
      }
      else {
          ttex -= k;
          ids.pop();
          tex.pop();
          ids.push(tid);
          tex.push(ttex);
      }

  }
  return 0;
}
