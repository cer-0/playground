# https://codeforces.com/problemset/problem/4/A

def main():
    n = int(input())
    total = 0
    for _ in range(n):
        if sum(map(int, input().split())) > 1:
            total += 1
    print(total)

if __name__ == "__main__":
    main()
